event_inherited(); 

enum NPCAlarms { Wandering_Update = 1, CheckPlayerDistance = 11 };


input_key = global.input_talk;
can_talk = false;

used_dialog = false;

talk_distance = 8;
talk_index = 0;

target_x = x;
target_y = y;

wander_origin_x = xstart;
wander_origin_y = ystart;

alarm[NPCAlarms.Wandering_Update] = random_range(TIME_SECOND, 2*TIME_SECOND);


npc_move_towards_point = function(_target_x, _target_y) {
    if (immobilized) return;
    
    var _hor = clamp(_target_x - x, -1, 1);
    var _ver = clamp(_target_y - y, -1, 1);
    
    if (_hor != 0 || _ver != 0) {
        var colls = array_concat(collision_tilemaps, [obj_enemy_base]);
        move_and_collide(_hor * move_speed, _ver * move_speed, colls, undefined, undefined, undefined, move_speed, move_speed);
        MOVING = true;
    } else {
        MOVING = false;
    }
}
