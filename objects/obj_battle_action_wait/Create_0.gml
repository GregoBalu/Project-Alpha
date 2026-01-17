event_inherited();

hotkey = global.input_battle_wait;

bonus_lifesteal = 0;
lifesteal_duration = 0;

attack_charge_gain = 0.4;
utility_charge_gain = 0.4;

attack_charge_gain_multiplier = 1;
utility_charge_gain_multiplier = 1;

unusable_turns_after_use = 0;
used_at = -1;

for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_wait_lifesteal) {
        bonus_lifesteal += _talent.bonus_lifesteal;
        lifesteal_duration = _talent.lifesteal_turns;
        attack_charge_gain -= _talent.minus_charge;
        utility_charge_gain -= _talent.minus_charge;
    } else if (_talent.object_index == obj_talent_wait_charge) {
        attack_charge_gain += _talent.bonus_attack_charge;
        utility_charge_gain -= _talent.minus_utility_charge;
    } else if (_talent.object_index == obj_talent_wait_more) {
        attack_charge_gain_multiplier += _talent.charge_multiplier-1;
        utility_charge_gain_multiplier += _talent.charge_multiplier-1;
        unusable_turns_after_use += _talent.skip_turn_after_use;
    }
}

action = function() {
    var animTime = BattlePlayerWaitAnimationTime;
    
    obj_battle_player.wait_used++;
    show_debug_message("Wait");
    
    obj_battle_player.play_wait_animation();
    
    if (lifesteal_duration > 0) {
        obj_battle_player.add_buff(new BattleBuff(lifesteal_duration, 
            {
                lifesteal_amount : bonus_lifesteal,
                sprite: spr_buff_lifesteal,
                hint: global.hint_buff_lifesteal
            },
            function(_data){
                //start
                obj_battle_player.data.lifesteal += _data.lifesteal_amount;
                //show_debug_message("New lifesteal is {0}", obj_battle_player.data.lifesteal);
            }, function(_data) {
                //end
                obj_battle_player.data.lifesteal -= _data.lifesteal_amount;
                //show_debug_message("New lifesteal is {0}", obj_battle_player.data.lifesteal);
            }));
    }
    if (unusable_turns_after_use>0) {
        used_at = obj_battle_manager.turn;
    }
    
    obj_battle_manager.player_turn(undefined, animTime);
    alarm[0] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
}

function canUse() {
    var _cannot_use = (unusable_turns_after_use>0 && used_at>=0 && (used_at+unusable_turns_after_use) > obj_battle_manager.turn );
    if (_cannot_use) return false;
    return obj_battle_manager.battle_started && !obj_battle_manager.enemy_turn && checkCost(cost_type, cost_amount);
}

hint = $"Wait [{key2str(hotkey)}]\nWait a turn and gain charge.\nCharge gain: {attack_charge_gain*attack_charge_gain_multiplier} attack, {utility_charge_gain*utility_charge_gain_multiplier} utility";