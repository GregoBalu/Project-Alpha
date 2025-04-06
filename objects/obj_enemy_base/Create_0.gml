event_inherited();

target_x = x;
target_y = y;

see_player = false

alarm[0] = move_tickdelay_seconds * TIME_SECOND;

function initBattle() {
    //Override me
}

function doEnemyAction(_selfData, _playerData) {
    //Override me
    return enemyWait(obj_battle_enemy);
}

function battleDraw() {
    //Override me
}