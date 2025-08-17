// Inherit the parent event
event_inherited();


animation.walk_down = spr_cobra_down;
animation.walk_up = spr_cobra_up;
animation.walk_right = spr_cobra_down;
animation.walk_left = spr_cobra_down;

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

doEnemyAction = function(_selfData, _playerData) {
    if (_selfData.charge_util >= 1) {
        return enemyCastAcid(1.1, obj_battle_enemy);
    }
    _selfData.charge_util += 0.2;
    return enemySimpleAttack(obj_battle_enemy);
}