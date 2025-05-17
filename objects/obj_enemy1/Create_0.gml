// Inherit the parent event
event_inherited();

color = choose(#FFFFFF, #FFEEEE, #FFDDDD, #FFCCCC);
image_blend = color;

battle.animation_attack = spr_firetoad_attack;
battle.animation_attack_fps = 20;
battle.animation_wait = spr_firetoad_wait;
battle.animation_wait_fps = 8;
battle.animation_cast = spr_firetoad_cast;
battle.animation_cast_fps = 12;
battle.idle_sound = snd_firetoad_idle;
battle.idle_sound_min_seconds = 5;
battle.idle_sound_max_seconds = 8;
battle.cast_source_delta = new Vec2(0, 0);


alarm[5] = random_range(5, 10) * TIME_SECOND;

function initBattle() {
    image_blend = color;
}

function doEnemyAction(_selfData, _playerData) {
    var _select = random_range(0, 10);
        
    if (_selfData.charge_attack >= 1) _select++;
    if (_selfData.charge_attack >= 2) _select++;
    if (_selfData.charge_util >= 1) _select++;
    if (_selfData.charge_util >= 2) _select++;
    
    if (_select < 5) {
        var _animTime = enemySimpleAttack(obj_battle_enemy);
        audio_play_sound(snd_firetoad_lick, 5, false, 1.0, 0, random_range(0.8, 1.3));
        return _animTime;
    } else if (_selfData.charge_util >= 1) {
        if (_select < 7) {
            var _animTime = enemyInterruptAttack(obj_battle_enemy);
            audio_play_sound(snd_firetoad_lick, 5, false, 1.0, 0, random_range(0.8, 1.1));
            return _animTime;
        } else {
            var _animTime = enemyCastFireball(1.2, obj_battle_enemy, 1, 1, 0.6);
            //TODO: sound
            return _animTime;
        }
    } else if (_selfData.charge_attack >= 1) {
        var _animTime = enemyHeavyAttack(obj_battle_enemy);
        //TODO:sound
        return _animTime;
    } else {
        var _animTime = enemyWait(obj_battle_enemy);
        audio_play_sound(snd_firetoad_wait, 5, false, 1.0, 0, random_range(0.8, 1.3));
        return _animTime;
    }
}

function onBattleDamageReceived(_damaged_amount) {
    //TODO
    //audio_play_sound(snd_ghost_damaged, 4, false, 1.0, 0.3);
}