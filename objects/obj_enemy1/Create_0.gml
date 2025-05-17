// Inherit the parent event
event_inherited();

color = choose(#FFFFFF, #FFEEEE, #FFDDDD, #FFCCCC);
image_blend = color;

battle.idle_sound = snd_firetoad_idle;
battle.idle_sound_min_seconds = 5;
battle.idle_sound_max_seconds = 8;
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
        audio_play_sound(snd_firetoad_lick, 5, false, 1.0, 0, random_range(8, 13)/10);
        return _animTime;
    } else if (_selfData.charge_util >= 1) {
        if (_select < 7) {
            return enemyInterruptAttack(obj_battle_enemy);
        } else {
            return enemyCastFireball(1.2, obj_battle_enemy);
        }
    } else if (_selfData.charge_attack >= 1) {
            return enemyHeavyAttack(obj_battle_enemy);
    } else {
        var _animTime = enemyWait(obj_battle_enemy);
        audio_play_sound(snd_firetoad_wait, 5, false, 1.0, 0, random_range(0.8, 1.3));
        return _animTime;
    }
}