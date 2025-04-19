event_inherited();

bonus_lifesteal = 0;
lifesteal_duration = 0;

charge_gain = 0.4;

for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_wait_lifesteal) {
        bonus_lifesteal += _talent.bonus_lifesteal;
        lifesteal_duration = _talent.lifesteal_turns;
        charge_gain -= _talent.minus_charge;
    }
}

action = function() {
    var animTime = BattlePlayerWaitAnimationTime;
    obj_battle_manager.player_turn(undefined, animTime);
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
                                        show_debug_message("New lifesteal is {0}", obj_battle_player.data.lifesteal);
                                    }, function(_data) {
                                        //end
                                        obj_battle_player.data.lifesteal -= _data.lifesteal_amount;
                                        show_debug_message("New lifesteal is {0}", obj_battle_player.data.lifesteal);
                                    }));
    }
    
    alarm[0] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
}

hint = $"Wait a turn and gain charge.\nCharge gain: {charge_gain} each"