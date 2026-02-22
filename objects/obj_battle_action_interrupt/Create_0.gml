event_inherited();

hotkey = global.input_battle_interrup;

enemy_charge_util_increase_amount = 1;
armor_decrease = 0;

debuff_stats = undefined;

for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_interrupt_armor_breaker) {
        armor_decrease += _talent.armor_decrease;
    } else if (_talent.object_index == obj_talent_interrupt_damage) {
        debuff_stats = {
            effect_turns: _talent.effect_turns,
            min_dmg: _talent.min_dmg,
            additional_dmg: _talent.additional_dmg,
            additional_enemy_armor: _talent.additional_armor
        };
    }
}

action = function() {
    if (checkCost(cost_type, cost_amount)) {
        obj_battle_player.data.charge_util -= cost_amount;
        
        obj_battle_player.interrupt_used++;
        
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
        if (debuff_stats != undefined) {
            obj_battle_enemy.add_buff(new BattleBuff(debuff_stats.effect_turns,
                    {
                        sprite: spr_debug_16,
                        hint: global.hint_debuff_int_dmg_delay,
                        min_dmg: debuff_stats.min_dmg,
                        additional_dmg: debuff_stats.additional_dmg,
                        additional_enemy_armor: debuff_stats.additional_enemy_armor,
                        damage_done: 0,
                        prev_hp: obj_battle_enemy.data.hp
                    },
                    function(_data) {
                        //start
                        _data.damage_done = 0;
                        _data.prev_hp = obj_battle_enemy.data.hp;
                    },
                    function(_data) {
                        //end
                        if (_data.damage_done >= _data.min_dmg) {
                            obj_battle_enemy.take_damage(_data.additional_dmg, false);
                            show_debug_message("Enemy took extra damage");
                        } else {
                            obj_battle_enemy.data.defense += _data.additional_enemy_armor;
                            show_debug_message($"Enemy gained armor: {obj_battle_enemy.data.defense}");
                        }
                    }, function (_data) {
                        //pre player turn 
                    }, function(_data) {
                        //post player turn
                        var _dmg = (obj_battle_enemy.data.hp - _data.prev_hp);
                        _data.damage_done += _dmg;
                        _data.prev_hp = obj_battle_enemy.data.hp;
                    }, function (_data) {
                        //pre enemy turn 
                    }, function(_data) {
                        //post enemy turn
                        var _dmg = (obj_battle_enemy.data.hp - _data.prev_hp);
                        _data.damage_done += _dmg;
                        _data.prev_hp = obj_battle_enemy.data.hp;
                    }
            ));
        }
        alarm[0] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
    }
};

hint = string(getText("Battle_act_interrupt_hint"), key2str(hotkey), cost_amount, enemy_charge_util_increase_amount);