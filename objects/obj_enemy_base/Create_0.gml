event_inherited();

target_x = x;
target_y = y;
using_path = false;

see_player = false;
player_close = false;

check_player_close = function() {
    if (distance_to_object(obj_player) < camera_get_view_width(obj_player.camera.cam)*1.5) {
        player_close = true;
        visible = false;
    } else {
        player_close = false;
        visible = true;
    }
    alarm[11] = random_range(1.5,2.5)*TIME_SECOND;
}
check_player_close();

animation = {
    idle_stand: sprite_index,
    isFirstStand: true,
    walk_up: sprite_index,
    walk_right: sprite_index,
    walk_down: sprite_index,
    walk_left: sprite_index
};


loot_point_offset = array_create(2);
if (loot_point[0] == 0 && loot_point[1] == 0) {
    loot_point_offset = [0,0];
} else {
    loot_point_offset[0] = loot_point[0]-x;
    loot_point_offset[1] = loot_point[1]-y;
    //show_debug_message($"loot to {loot_point[0]},{loot_point[1]} -> offset={loot_point_offset[0]},{loot_point_offset[1]}");
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
    
    cast_source_delta: new Vec2(-20, -sprite_height/2),
    
    battle_screen_sprite: spr_battle_screen,
    battle_screen_sprite_speed: 1,
    battle_screen_animated: spr_battle_screen_splitted,
    battle_screen_animated_max_frames: 14,
    battle_screen_animated_fps: 10
};
if (room == Room1) {
    battle.battle_screen_sprite = spr_battle_screen_dungeon;
    battle.battle_screen_sprite_speed = 4;
    battle.battle_screen_animated = spr_battle_screen_dungeon_animated;
    battle.battle_screen_animated_max_frames = 8;
    battle.battle_screen_animated_fps = 6;
} else if (room == rm_cave) {
    battle.battle_screen_sprite = spr_battle_screen_cave;
    battle.battle_screen_sprite_speed = 4;
    battle.battle_screen_animated = spr_battle_screen_splitted;
}

initBattle = function(_self) {
    //Override me
}

doEnemyAction = function(_selfData, _playerData) {
    //Override me
    return enemyWait(obj_battle_enemy);
}

battleDraw = function(_self) {
    //Override me
}