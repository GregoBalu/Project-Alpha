// Inherit the parent event
event_inherited();

if (room == rm_cave) {
    battle.battle_screen_sprite = spr_battle_screen_cave;
    battle.battle_screen_sprite_speed = 2;
}

doEnemyAction = function(_selfData, _playerData) {
    if (_selfData.charge_util >= 1) {
        return enemyCastAcid(1.1, obj_battle_enemy);
    }
    _selfData.charge_util += 0.2;
    return enemySimpleAttack(obj_battle_enemy);
}