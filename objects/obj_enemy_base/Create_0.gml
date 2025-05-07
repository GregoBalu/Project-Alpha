event_inherited();

target_x = x;
target_y = y;

see_player = false

alarm[0] = move_tickdelay_seconds * TIME_SECOND;

battle = {
    animation_attack: battle_animation_attack,
    animation_attack_fps: battle_animation_attack_fps,
    animation_wait: battle_animation_wait,
    animation_wait_fps: battle_animation_wait_fps
};

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