event_inherited();

hotkey = global.input_battle_interrup;

enemy_charge_util_increase_amount = 1;
armor_decrease = 0;

for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_interrupt_armor_breaker) {
        armor_decrease += _talent.armor_decrease;
    }
}

action = function() {
    if (checkCost(cost_type, cost_amount)) {
        obj_battle_player.data.charge_util -= cost_amount;
        
        var _did_crit = calc_crit(obj_battle_player.data.crit_chance);
        
        var animTime = BattlePlayerAttackAnimationTime;
        obj_battle_manager.player_turn(undefined, animTime);
        obj_battle_player.play_attack_animation(false);
        obj_battle_enemy.add_buff(new BattleBuff(4, 
                {
                    sprite: spr_buff_stun,
                    hint: global.hint_buff_stun
                },
                function(_data){
                    //start
                    obj_battle_enemy.is_stunned = true;
                }, function(_data) {
                    //end
                    obj_battle_enemy.is_stunned = false;
                }));
        if (armor_decrease > 0) {
            obj_battle_enemy.add_buff(new BattleBuff(_did_crit?6:3, 
                    {
                        sprite:spr_buff_armor_shred,
                        hint: global.hint_buff_armor_shred
                    }, 
                    function(_data) {
                        //start
                        show_debug_message("Armor shredding applied");
                        obj_battle_enemy.data.defense -= armor_decrease;
                    }, function(_data) {
                        //end
                        show_debug_message("Armor shredding end");
                        obj_battle_enemy.data.defense += armor_decrease;
                    }));
        }
        alarm[0] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
    }
};

hint = string($"Interrupt [{key2str(hotkey)}]\nInterrupt the enemy stunning it for 2 rounds and angering it.\nCost: {cost_amount}\nIncrease enemy charge attack by: {enemy_charge_util_increase_amount}");