// Inherit the parent event
event_inherited();


show_debug_message($"x={x} y={y} id={id}")


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