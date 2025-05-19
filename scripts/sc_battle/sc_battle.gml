function isBaamAddonEnabled() {
    return true;
}

#macro Battle_Text_Roll_Normal #CC0000
#macro Battle_Text_Roll_Crit #DD8050

#macro Battle_Text_Roll_Heal_Normal #22FF22
#macro Battle_Text_Roll_Heal_Crit #A0DD30

hint_buff_fire = "Ignited: lowers defense and take DoT each turn";
hint_buff_corruption = "Corruption: significant DoT each turn";
hint_buff_acid = "Acid spit: lowers defense and take DoT each turn";
hint_buff_stun = "Stun: cannot take action";
hint_buff_lifesteal = "Lifesteal: dealing damage heals a portion of it";
hint_buff_armor_shred = "Armor shred: defense reduced";

/**
 * Function to calculate crit.
 * @param {real} _crit_chance Crit chance (0-1)
 * @returns {bool} True if a crit did happen.
 */
function calc_crit(_crit_chance) {
    var crit = random_range(0, 1);
    if (crit < _crit_chance) {
        //show_debug_message("Crit!");
        return true;   
    }
    return false;
}

/**
 * Function to calculate damage dealt taking crit into account.
 * @param {real} _base_damage Base amount of damage to be dealt.
 * @param {real} _crit_chance Crit chance (0-1)
 * @returns {struct} Struct containing the actual damage (increased with crit) and did_crit that indicates said crit event.
 */
function calc_damage(_base_damage, _crit_chance){
    var damage = _base_damage * random_range(0.9, 1.1);
    var didCrit = calc_crit(_crit_chance);
    if (didCrit) {
        damage *= 2;
        if (isBaamAddonEnabled()) {
            show_debug_message("BaaM: {0}", damage);
        }
    }
    return { damage : damage, did_crit : didCrit};
}

function getBattleAfterActionCooldownSeconds() {
    return 0.3;
}

function checkCost(cost_type, cost_amount) {
    var gotCost = false;
    if (cost_type == "None") {
        gotCost = true;
    } else if (cost_type == "AttackCharge") {
        gotCost = (obj_battle_player.data.charge_attack >= cost_amount);
    } else if (cost_type == "UtilityCharge") {
        gotCost = (obj_battle_player.data.charge_util >= cost_amount);
    } else if (cost_type == "AttackAndUtilityCharge") {
        gotCost = (obj_battle_player.data.charge_attack >= cost_amount) && (obj_battle_player.data.charge_util >= cost_amount);
    } else {
        show_debug_message("Error battle cost type: {0}", cost_type);
    }
    
    return gotCost;
}

function enemySimpleAttack(_obj) {
    var _enemy_damage = calc_damage(obj_battle_enemy.data.damage, obj_battle_enemy.data.crit_chance);
    
    var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
    if (obj_battle_enemy.data.lifesteal > 0) {
        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
    }
    var _animTime = obj_battle_enemy.play_attack_animation(_enemy_damage.did_crit);
    
    obj_battle_enemy.data.charge_attack = clamp(obj_battle_enemy.data.charge_attack + .4, 0, obj_battle_enemy.data.charge_attack_total);
    
    return _animTime;
}

function enemyCastFireball(_damage_modifier, _obj, _dot_dmg_modifier = 1.0, _dot_len_modifier = 1.0, _projectile_delay_seconds = 0) {
    obj_battle_enemy.data.charge_util -= 1;
    
    var _enemy_damage = calc_damage(obj_battle_enemy.data.damage*_damage_modifier, obj_battle_enemy.data.crit_chance);
    
    var _animTime = obj_battle_enemy.play_cast_animation(_enemy_damage.did_crit);
    
    spawn_projectile_p2p(spr_fireball, _obj.x+_obj.data.battle.cast_source_delta.x, _obj.y+_obj.data.battle.cast_source_delta.y,  
            obj_battle_player.x+10, obj_battle_player.y, _obj.depth, 2.0, spr_fireball_explosion, 0.5, _projectile_delay_seconds);
    
    var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
    if (obj_battle_enemy.data.lifesteal > 0) {
        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
    }
    
    obj_battle_player.add_buff(new BattleBuff((_enemy_damage.did_crit?4:2)*_dot_len_modifier, 
                                {
                                    original_damage : _enemy_damage.damage,
                                    did_crit : _enemy_damage.did_crit,
                                    dot_dmg_mod : _dot_dmg_modifier,
                                    sprite: spr_buff_fire,
                                    hint: global.hint_buff_fire
                                },
                                function(_data){
                                    //start
                                    obj_battle_player.data.defense -= 0.1;
                                }, function(_data) {
                                    //end
                                    obj_battle_player.data.defense += 0.1;
                                }, function(_data) {
                                    //player turn pre
                                    obj_battle_player.image_blend = c_red;
                                    var _actual_dmg = obj_battle_player.take_damage(0.1*_data.dot_dmg_mod*_data.original_damage,_data.did_crit);
                                    if (obj_battle_enemy.data.lifesteal > 0) {
                                        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _data.did_crit);
                                    }
                                    obj_battle_player.image_blend = c_white;
                                }));
    
    obj_battle_enemy.data.charge_util = clamp(obj_battle_enemy.data.charge_util + .4, 0, obj_battle_enemy.data.charge_util_total);
    
    return _animTime;
}

function enemyCastCorruptionBolt(_damage_modifier, _obj, _dot_dmg_modifier = 1.0, _dot_len_modifier = 1.0) {
    obj_battle_enemy.data.charge_util -= 1;
    
    var _enemy_damage = calc_damage(obj_battle_enemy.data.damage*_damage_modifier, obj_battle_enemy.data.crit_chance);
    var _animTime = BattleEnemyAttackAnimationTime;
    
    obj_battle_enemy.play_cast_animation(_enemy_damage.did_crit);
    
    spawn_projectile(spr_corruption_bolt, _obj.x+_obj.data.battle.cast_source_delta.x, _obj.y+_obj.data.battle.cast_source_delta.y, _obj.depth, 
            point_direction(_obj.x-20, _obj.y-_obj.sprite_height/2, obj_battle_player.x, obj_battle_player.y), 1.9, 3.0,
            spr_corruption_bolt_explosion, 1.5);
    
    var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
    if (obj_battle_enemy.data.lifesteal > 0) {
        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
    }
    
    audio_play_sound(snd_ghost_special, 5, false, 1.0, 0.5);
    obj_battle_player.add_buff(new BattleBuff((_enemy_damage.did_crit?4:2)*_dot_len_modifier, 
                                {
                                    original_damage : _enemy_damage.damage,
                                    did_crit : _enemy_damage.did_crit,
                                    dot_dmg_mod : _dot_dmg_modifier,
                                    sprite: spr_buff_corruption,
                                    hint: global.hint_buff_corruption
                                },
                                function(_data){
                                    //start
                                }, function(_data) {
                                    //end
                                }, function(_data) {
                                    //player turn pre
                                    obj_battle_player.image_blend = c_purple;
                                    var _actual_dmg = obj_battle_player.take_damage(0.5*_data.dot_dmg_mod*_data.original_damage,_data.did_crit);
                                    if (obj_battle_enemy.data.lifesteal > 0) {
                                        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _data.did_crit);
                                    }
                                    obj_battle_player.image_blend = c_white;
                                }));
    
    obj_battle_enemy.data.charge_util = clamp(obj_battle_enemy.data.charge_util + .4, 0, obj_battle_enemy.data.charge_util_total);
    
    return _animTime;
}

function enemyCastInferno(_obj) {
    
    var _enemy_damage = calc_damage(obj_battle_enemy.data.damage*3, obj_battle_enemy.data.crit_chance*2);
        
    obj_battle_enemy.play_cast_animation(_enemy_damage.did_crit);
    
    screenshake(0.1*TIME_SECOND, 2*TIME_SECOND, 2, 0.5);
    
    obj_battle_full_screen_efect.display_screen_effect(spr_full_flames, 6, 0.8, 2);
    
    audio_play_sound(snd_fire, 5, false, 0.7*global.audio_master_volume*global.audio_sfx_volume, undefined, 0.6);
    
    var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
    if (obj_battle_enemy.data.lifesteal > 0) {
        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
    }
    
    obj_battle_player.add_buff(new BattleBuff((_enemy_damage.did_crit?6:4), 
                                {
                                    original_damage : _enemy_damage.damage,
                                    did_crit : _enemy_damage.did_crit,
                                    sprite: spr_buff_fire,
                                    hint: global.hint_buff_fire
                                },
                                function(_data){
                                    //start
                                    obj_battle_player.data.defense -= 0.5;
                                }, function(_data) {
                                    //end
                                    obj_battle_player.data.defense += 0.5;
                                }, function(_data) {
                                    //player turn pre
                                    obj_battle_player.image_blend = c_red;
                                    var _actual_dmg = obj_battle_player.take_damage(0.1*_data.original_damage, _data.did_crit);
                                    if (obj_battle_enemy.data.lifesteal > 0) {
                                        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _data.did_crit);
                                    }
                                    obj_battle_player.image_blend = c_white;
                                }));
    
    return 2;
}

function enemyCastAcid(_damage_modifier, _obj) {
    obj_battle_enemy.data.charge_util -= 1;
    
    var _enemy_damage = calc_damage(obj_battle_enemy.data.damage*_damage_modifier, obj_battle_enemy.data.crit_chance);
    var _animTime = BattleEnemyAttackAnimationTime;
    
    obj_battle_enemy.play_cast_animation(_enemy_damage.did_crit);
    
    spawn_projectile(spr_acid, _obj.x+_obj.data.battle.cast_source_delta.x, _obj.y+_obj.data.battle.cast_source_delta.y, _obj.depth, 180, 2, 1.5);
    
    var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
    if (obj_battle_enemy.data.lifesteal > 0) {
        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
    }
    
    obj_battle_player.add_buff(new BattleBuff(_enemy_damage.did_crit?6:4, 
                                {
                                    original_damage : _enemy_damage.damage,
                                    did_crit : _enemy_damage.did_crit,
                                    sprite: spr_buff_acid,
                                    hint: global.hint_buff_acid
                                },
                                function(_data){
                                    //start
                                    obj_battle_player.data.defense -= 0.5;
                                }, function(_data) {
                                    //end
                                    obj_battle_player.data.defense += 0.5;
                                }, function(_data) {
                                    //player turn pre
                                    obj_battle_player.image_blend = c_green;
                                    var _actual_dmg = obj_battle_player.take_damage(0.1*_data.original_damage, _data.did_crit);
                                    if (obj_battle_enemy.data.lifesteal > 0) {
                                        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _data.did_crit);
                                    }
                                    obj_battle_player.image_blend = c_white;
                                }));
    
    obj_battle_enemy.data.charge_util = clamp(obj_battle_enemy.data.charge_util + .4, 0, obj_battle_enemy.data.charge_util_total);
    
    return _animTime;
}

function enemyWait(_obj) {
    var _animTime = obj_battle_enemy.play_wait_animation();
    
    obj_battle_enemy.data.charge_attack = clamp(obj_battle_enemy.data.charge_attack + .4, 0, obj_battle_enemy.data.charge_attack_total);
    obj_battle_enemy.data.charge_util = clamp(obj_battle_enemy.data.charge_util + .4, 0, obj_battle_enemy.data.charge_util_total);
    
    return _animTime;
}

function enemyHeavyAttack(_obj) {
    obj_battle_enemy.data.charge_attack -= 1;
            
    var _enemy_damage = calc_damage(obj_battle_enemy.data.damage*2, obj_battle_enemy.data.crit_chance);
    var _animTime = BattleEnemyAttackAnimationTime;
    
    var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
    if (obj_battle_enemy.data.lifesteal > 0) {
        obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
    }
    obj_battle_enemy.play_heavyattack_animation(_enemy_damage.did_crit);
    
    obj_battle_enemy.data.charge_attack = clamp(obj_battle_enemy.data.charge_attack + .4, 0, obj_battle_enemy.data.charge_attack_total);
    
    screenshake(0.1*TIME_SECOND, 0.2*TIME_SECOND, 1.5, 0.5);
    
    return _animTime;
}

function enemyInterruptAttack(_obj, _turns = 2) {
    obj_battle_enemy.data.charge_util -= 1;
            
    var animTime = obj_battle_enemy.play_attack_animation(false);
    obj_battle_player.add_buff(new BattleBuff(_turns, 
                    {
                        sprite: spr_buff_stun,
                        hint: global.hint_buff_stun
                    },
                    function(_data){
                        //start
                        obj_battle_player.is_stunned = true;
                    }, function(_data) {
                        //end
                        obj_battle_player.is_stunned = false;
                    }));
    
    obj_battle_player.data.charge_util = clamp(obj_battle_player.data.charge_util + 1, 0, obj_battle_player.data.charge_util_total);
    return animTime;
}

function get_xp_total(_level) {
    //10log(x)+20
    static _xp_table = [20, 23, 25, 26, 27, 28, 29, 29, 30];
    static _len = array_length(_xp_table);
    if (_level < _len) {
        return _xp_table[_level-1];
    }
    return _xp_table[_len-1];
}

/**
 * Function to create a buff used in battle.
 * @param {real}    _turns Number of turns the buff is active (1 turn = player action/enemy action, 2 turns = player action -> enemy action -> )
 * @param {struct}  _data Additional data to provide.
 * @param {Function} _startFunc Function to be called on buff start
 * @param {Function} _endFunc Function to be called on buff end
 * @param {Function} [_playerTurnPreFunc] Function to be called before player turn.
 * @param {Function} [_playerTurnPostFunc] Function to be called after player turn.
 * @param {Function} [_enemyTurnPreFunc] Function to be called before enemy turn.
 * @param {Function} [_enemyTurnPostFunc] Function to be called after enemy turn.
 */
function BattleBuff(_turns, _data, _startFunc, _endFunc, _playerTurnPreFunc = undefined, _playerTurnPostFunc = undefined,
         _enemyTurnPreFunc = undefined, _enemyTurnPostFunc = undefined) constructor {
    max_turns = _turns;
    remaining_turns = max_turns;
    data = _data;
    start_func = _startFunc;
    end_func = _endFunc;
    player_pre_func = _playerTurnPreFunc;
    player_post_func = _playerTurnPostFunc;
    enemy_pre_func = _enemyTurnPreFunc;
    enemy_post_func = _enemyTurnPostFunc;
            
    start_func(data);
    
    function turn(_is_next_turn_player) {
        if (remaining_turns == 0) return;
        
        --remaining_turns;
        if (remaining_turns == 0) {
            end_func(data);
            return;
        }
        if (_is_next_turn_player) {
            //show_debug_message("Buff tick enemy->player");
            if (enemy_post_func != undefined) enemy_post_func(data);
            if (player_pre_func != undefined) player_pre_func(data);
        } else {
            //show_debug_message("Buff tick player->enemy");
            if (player_post_func != undefined) player_post_func(data);
            if (enemy_pre_func != undefined) enemy_pre_func(data);
        }
    }
            
    function stop() {
        end_func(data);
        remaining_turns = 0;
    }
}

/**
 * Function Spawns a projectile instance with given parameters.
 * @param {Asset.GMSprite} _sprite Sprite to spawn
 * @param {real} _x X coord of the projectile to spawn at
 * @param {real} _y Y coord of the projectile to spawn at
 * @param {real} _depth Depth of the projectile image
 * @param {real} _dir Direction of the projectile to fly
 * @param {real} _speed Speed of the flying projectile
 * @param {real} _life_seconds Seconds of lifetime of the projectile
 * @param {Asset.GMSprite} [_splash_sprite]=noone Extra splash sprite to play at the end of the projectile's path
 * @param {real} [_splash_seconds]=0 Seconds to play the explosion animation for.
 * @returns {Id.Instance} Id of the newly spawned projectile instance.
 */
function spawn_projectile(_sprite, _x, _y, _depth, _dir, _speed, _life_seconds, _splash_sprite = noone, _splash_seconds = 0, _delay_seconds = 0) {
    return instance_create_layer(_x, _y, "Effects", obj_battle_projectile, {
        sprite_index : _sprite,
        //depth : _depth,
        move_direction : _dir,
        move_speed : _speed,
        life_seconds : _life_seconds,
        splash_image : _splash_sprite,
        splash_seconds : _splash_seconds,
        initial_delay_seconds : _delay_seconds
    });
}

function spawn_projectile_p2p(_sprite, _from_x, _from_y, _to_x, _to_y, _depth, _life_seconds, _splash_sprite = noone, _splash_seconds = 0, _delay_seconds = 0) {
    var _dir = point_direction(_from_x, _from_y, _to_x, _to_y);
    var _speed = point_distance(_from_x, _from_y, _to_x, _to_y) / (_life_seconds*TIME_SECOND-_splash_seconds*TIME_SECOND );
    
    return instance_create_layer(_from_x, _from_y, "Effects", obj_battle_projectile, {
        sprite_index : _sprite,
        //depth : _depth,
        move_direction : _dir,
        move_speed : _speed,
        life_seconds : _life_seconds,
        splash_image : _splash_sprite,
        splash_seconds : _splash_seconds,
        initial_delay_seconds : _delay_seconds
    });
}










