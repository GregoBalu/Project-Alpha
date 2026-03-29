// Inherit the parent event
event_inherited();

lesser_tentacles_remaining = array_length(lesser_tentacles);

battle_state = 0; //0: first turn in attack pattern

battle.animation_attack = spr_water_thing_lesser_end;
battle.animation_attack_fps = 8;
/*battle.animation_wait = spr_firetoad_wait;
battle.animation_wait_fps = 8;
battle.animation_cast = spr_firetoad_cast;
battle.animation_cast_fps = 12;
battle.idle_sound = snd_firetoad_idle;
battle.idle_sound_min_seconds = 5;
battle.idle_sound_max_seconds = 8;
battle.cast_source_delta = new Vec2(0, 0);*/
battle.battle_screen_sprite = spr_battle_screen_cave_water;
battle.battle_screen_sprite_speed = 4;
battle.battle_screen_animated = spr_battle_screen_cave_water_animated;
battle.battle_screen_animated_fps = 6;
battle.battle_screen_animated_max_frames = 8;

initBattle = function(_self) {
    //Override me
}

doEnemyAction = function(_selfData, _playerData) {
    //Override me
    show_debug_message($"battle_state={battle_state} lesser_tentacles_remaining={lesser_tentacles_remaining}");
    if (lesser_tentacles_remaining > 0) {
        if (battle_state == 0) {
            ++battle_state;
            var _animTime = enemyInterruptAttack(obj_battle_enemy, 2*lesser_tentacles_remaining);
            //TODO: audio
            return _animTime;
        } else if (battle_state == 1) {
            ++battle_state;
            var _animTime = enemySimpleAttack(obj_battle_enemy);
            //TODO: audio
            return _animTime;
        } else if (battle_state == 2) {
            ++battle_state;
            var _animTime = enemySimpleAttack(obj_battle_enemy);
            //TODO: audio
            return _animTime;
        } else if (charge_attack >= 1) {
            battle_state = 0;
            var _animTime = enemyHeavyAttack(obj_battle_enemy);
            //TODO: audio
            return _animTime;
        } else {
            battle_state = 0;
            var _animTime = enemyWait(obj_battle_enemy);
            //TODO: audio
            return _animTime;
        }
    } else {
        
        if (charge_attack >= 1) {
            var _animTime = enemyHeavyAttack(obj_battle_enemy);
            //TODO: audio
            return _animTime;
        } else if (charge_util >= 1.5) {
            var _animTime = enemyInterruptAttack(obj_battle_enemy, global.BUFF_TURNS_PER_COMBAT_TURNS*2);
            //TODO: audio
            return _animTime;
        }
        
        var _act = random_range(0, 5);
        if (_act < 4) {
            var _animTime = enemyWait(obj_battle_enemy);
            //TODO: audio
            return _animTime;
        } else {
            var _animTime = enemySimpleAttack(obj_battle_enemy);
            //TODO: audio
            return _animTime;
        }
        
        
    }
}

battleDraw = function(_self) {
    //Override me
}