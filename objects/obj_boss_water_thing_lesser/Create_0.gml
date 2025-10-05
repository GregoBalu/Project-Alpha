// Inherit the parent event
event_inherited();


//battle.animation_attack: noone,
//battle.animation_attack_fps: 1,
//battle.animation_heavyattack: noone,
//battle.animation_heavyattack_fps: 1,
//battle.animation_wait: noone,
//battle.animation_wait_fps: 1,
battle.animation_cast = spr_water_thing_lesser_end_cast;
battle.animation_cast_fps = 8;
//battle.idle_sound: noone,
//battle.idle_sound_min_seconds: 5,
//battle.idle_sound_max_seconds: 10,
battle.battle_screen_sprite = spr_battle_screen_cave_water;
battle.battle_screen_sprite_speed = 4;




initBattle = function(_self) {
    
    _self.base_stun_chance = 0.0;
    _self.stun_chance = 0.5;
}

doEnemyAction = function(_selfData, _playerData) {
    
    var _rand = random_range(0, 1);
    //show_debug_message($"Stun rand: {_rand} < {obj_battle_enemy.stun_chance}");
    if (_rand < obj_battle_enemy.stun_chance) {
        _selfData.charge_util++;
        var _animTime = enemyInterruptAttack(obj_battle_enemy);
        //audio_play_sound(snd_firetoad_lick, 5, false, 1.0, 0, random_range(0.8, 1.3)); //TODO: sound
        obj_battle_enemy.stun_chance = obj_battle_enemy.base_stun_chance;
        return _animTime;
    } else {
        obj_battle_enemy.stun_chance += 0.2;
    }
    
    _rand = random_range(0, 1);
    //show_debug_message($"Attack rand: {_rand}");
    if (_rand < 0.3) {
        //show_debug_message("Squeeze!");
        //sqeeze
        var _enemy_damage = calc_damage(obj_battle_enemy.data.damage, 0);
      
        var _animTime = obj_battle_enemy.play_attack_animation(false);
        
        obj_battle_player.add_buff(new BattleBuff(2, 
                        { 
                            original_damage: _enemy_damage,
                            did_free: false,
                            pre_wait_used: 0,
                            sprite: spr_buff_squeeze,
                            hint: "You are being squeezed, you cannot breathe. You have to relax somehow ..."
                        },
                        function(_data){
                            //start
                            //show_debug_message($"Squeeze start");
                        }, function(_data) {
                            //end 
                            //show_debug_message($"Squeeze end {_data.did_free} {obj_battle_player.wait_used}");
                            if (_data.did_free) exit;
                            if (obj_battle_player.wait_used > _data.pre_wait_used) {
                                //show_debug_message("Free!");
                                _data.did_free = true;
                                exit;
                            }
                                
                            var _actual_dmg = obj_battle_player.take_damage(_data.original_damage.damage, false);
                            if (obj_battle_enemy.data.lifesteal > 0) {
                                obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, false);
                            }
                        }, function(_data) {
                           //player pre
                            _data.pre_wait_used = obj_battle_player.wait_used;
                            //show_debug_message($"Squeeze pre player {_data.pre_wait_used}");
                        }, function(_data) {
                            //player post
                            //check if waited, remove buff
                            //show_debug_message($"Squeeze post player {obj_battle_player.wait_used}");
                            if (obj_battle_player.wait_used > _data.pre_wait_used) {
                                _data.did_free = true;
                            }
                        }
        ));
        
        //TODO: sound
        return _animTime;
    } else if (_rand < 0.8) {
        //show_debug_message("Attack!");
        var _animTime = enemySimpleAttack(obj_battle_enemy);
        //TODO: sound
        return _animTime;
    } else if (_rand < 0.9) {
        //show_debug_message("Wait!");
        var _animTime = enemyWait(obj_battle_enemy);
        //TODO: sound
        return _animTime;
    } else {
        //show_debug_message("Refreshing Waters!");
        //refreshing waters
        var _animTime = obj_battle_enemy.play_cast_animation(false);
        obj_battle_enemy.take_damage(-5, false);
        
        //TODO: sound
        return _animTime;
    }
}

battleDraw = function(_self) {
    //Override me
}