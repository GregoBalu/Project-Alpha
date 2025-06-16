// Inherit the parent event
event_inherited();





initBattle = function() {
    obj_battle_enemy.base_stun_chance = 0.0;
    obj_battle_enemy.stun_chance = 0.5;
}

doEnemyAction = function(_selfData, _playerData) {
    
    var _rand = random_range(0, 1);
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
    if (_rand < 0.3) {
        //sqeeze
        var _enemy_damage = calc_damage(obj_battle_enemy.data.damage, 0);
      
        var _animTime = obj_battle_enemy.play_attack_animation(false);
        
        obj_battle_player.add_buff(new BattleBuff(2, 
                        { 
                            original_damage: _enemy_damage,
                            did_free: false,
                            pre_wait_used: 0,
                            sprite: spr_debug_16,
                            hint: "You are being squeezed, you cannot breathe. You have to relax somehow ..."
                        },
                        function(_data){
                            //start
                            
                        }, function(_data) {
                            //end 
                            if (_data.did_free) exit;
                                
                            var _actual_dmg = obj_battle_player.take_damage(_data.original_damage.damage, false);
                            if (obj_battle_enemy.data.lifesteal > 0) {
                                obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, false);
                            }
                        }, function(_data) {
                           //player pre
                            _data.pre_wait_used = obj_battle_player.wait_used;
                        }, function(_data) {
                            //player post
                            //check if waited, remove buff
                            if (obj_battle_player.wait_used > _data.pre_wait_used) {
                                _data.did_free = true;
                                remaining_turns = 0;
                            }
                        }
        ));
        
        //TODO: sound
        return _animTime;
    } else if (_rand < 0.8) {
        var _animTime = enemySimpleAttack(obj_battle_enemy);
        //TODO: sound
        return _animTime;
    } else if (_rand < 0.9) {
        var _animTime = enemyWait(obj_battle_enemy);
        //TODO: sound
        return _animTime;
    } else {
        //refreshing waters
        var _animTime = obj_battle_enemy.play_cast_animation(false);
        obj_battle_enemy.data.hp = clamp(obj_battle_enemy.data.hp + 5, 0, obj_battle_enemy.data.hp_total);
        
        //TODO: sound
        return _animTime;
    }
    
    return enemyWait(obj_battle_enemy);
}

battleDraw = function() {
    //Override me
}