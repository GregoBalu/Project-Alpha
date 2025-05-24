event_inherited();

target_x = x;
target_y = y;

see_player = false

loot_point_offset = array_create(2);
if (loot_point[0] == 0 && loot_point[1] == 0) {
    loot_point_offset = [0,0];
} else {
    loot_point_offset[0] = loot_point[0]-x;
    loot_point_offset[1] = loot_point[1]-y;
    show_debug_message($"loot to {loot_point[0]},{loot_point[1]} -> offset={loot_point_offset[0]},{loot_point_offset[1]}");
}

if (wander_range > 0 && move_speed > 0) {
    alarm[0] = move_tickdelay_seconds * TIME_SECOND;
}

battle = {
    animation_attack: noone,
    animation_attack_fps: 1,
    animation_heavyattack: noone,
    animation_heavyattack_fps: 1,
    animation_wait: noone,
    animation_wait_fps: 1,
    animation_cast: noone,
    animation_cast_fps: 1,
    idle_sound: noone,
    idle_sound_min_seconds: 5,
    idle_sound_max_seconds: 10,
    
    cast_source_delta: new Vec2(-20, -sprite_height/2)
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