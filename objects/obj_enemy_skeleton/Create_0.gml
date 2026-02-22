// Inherit the parent event
event_inherited();
init_localisation();

animation.walk_down = spr_enemy_skeleton;
animation.walk_up = spr_enemy_skeleton;
animation.walk_right = spr_enemy_skeleton;
animation.walk_left = spr_enemy_skeleton;

/*battle.animation_attack = spr_firetoad_attack;
battle.animation_attack_fps = 20;
battle.animation_wait = spr_firetoad_wait;
battle.animation_wait_fps = 8;
battle.animation_cast = spr_firetoad_cast;
battle.animation_cast_fps = 12;
battle.idle_sound = snd_firetoad_idle;
battle.idle_sound_min_seconds = 5;
battle.idle_sound_max_seconds = 8;
battle.cast_source_delta = new Vec2(0, 0);*/

bleed_debuff = undefined;

addCriticalBleed = function(_selfData, _playerData) {
    if (_selfData.bleed_debuff != undefined && _selfData.bleed_debuff.remaining_turns == 0) {
        delete _selfData.bleed_debuff;
        _selfData.bleed_debuff = undefined;
    }
    
    if (_selfData.bleed_debuff == undefined) {
        //apply new dot
        if (DEBUG) {
            show_debug_message($"Adding new bleed debuff");
        }
        _selfData.bleed_debuff = new BattleBuff(1*global.BUFF_TURNS_PER_COMBAT_TURNS, 
                                {
                                    dot_base_dmg: 1,
                                    stack: 1,
                                    sprite: spr_buff_bleed,
                                    hint: getText("Buff_crit_bleed_hint")
                                },
                                function(_data){
                                    //start
                                }, function(_data) {
                                    //end
                                }, function(_data) {
                                    //player turn pre
                                    obj_battle_player.image_blend = c_red;
                                    var _actual_dmg = obj_battle_player.take_damage(_data.dot_base_dmg*_data.stack, false);
                                    if (obj_battle_enemy.data.lifesteal > 0) {
                                        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, false);
                                    }
                                    obj_battle_player.image_blend = c_white;
                                })
        obj_battle_player.add_buff(_selfData.bleed_debuff);
    } else {
        //refresh dot
        _selfData.bleed_debuff.data.stack++
        _selfData.bleed_debuff.remaining_turns = _selfData.bleed_debuff.max_turns;
        if (DEBUG) {
            show_debug_message($"Stacking new bleed debuff: {_selfData.bleed_debuff.data.stack}");
        }
    }
    
}

initBattle = function(_self) {
    //Override me
    _self.data.bleed_debuff = undefined;
}

doEnemyAction = function(_selfData, _playerData) {
    /*if (_selfData.charge_util >= 1) {
        return enemyCastAcid(1.1, obj_battle_enemy);
    }
    _selfData.charge_util += 0.2;*/
    
    var _select = random_range(0, 5);
    if (_select < 3) {
        if (DEBUG) {
            show_debug_message($"bleed_debuff={(_selfData.bleed_debuff == undefined)?"undef":"valid"}");
        }
        var _critChanceBonus = 0;
        var _critDamageMultiplier = 2;
        if (_selfData.bleed_debuff != undefined && _selfData.bleed_debuff.remaining_turns == 0) {
            _selfData.bleed_debuff = undefined;
        }
        if (_selfData.bleed_debuff != undefined) {
            _critChanceBonus = _selfData.bleed_debuff.data.stack * 0.1;
            _critDamageMultiplier += _selfData.bleed_debuff.data.stack * 0.1;
        }
        if (DEBUG) {
            show_debug_message($"Crit chance:{_critChanceBonus}, crit dmg:x{_critDamageMultiplier}");
        }
        var _enemy_damage = calc_damage(obj_battle_enemy.data.damage, obj_battle_enemy.data.crit_chance + _critChanceBonus, _critDamageMultiplier);
        if (!_enemy_damage.did_crit) {
            // apply 1 stack of Critical bleed
            addCriticalBleed(_selfData, _playerData);
        } else {
            // remove Critical bleed
            if (DEBUG) {
                show_debug_message("Removing bleed");
            }
            _selfData.bleed_debuff.remaining_turns = 0;
        }
        
        var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
        if (obj_battle_enemy.data.lifesteal > 0) {
            obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
        }
        var _animTime = obj_battle_enemy.play_attack_animation(_enemy_damage.did_crit);
        
        obj_battle_enemy.data.charge_attack = clamp(obj_battle_enemy.data.charge_attack + .4, 0, obj_battle_enemy.data.charge_attack_total);
        //TODO: sound
        return _animTime;
    } else if (_selfData.charge_util >= 1) {
        var _animTime = enemyInterruptAttack(obj_battle_enemy);
        //TODO audio_play_sound(snd_firetoad_lick, AUDIO_PRIO_EFFECTS, false, 1.0, 0, random_range(0.8, 1.1));
        return _animTime;
    } else {
        var _animTime = enemyWait(obj_battle_enemy);
        //TODO audio_play_sound(snd_firetoad_wait, AUDIO_PRIO_EFFECTS, false, 1.2, 0, random_range(0.8, 1.3));
        return _animTime;
    }
}