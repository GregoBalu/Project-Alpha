// Inherit the parent event
event_inherited();

if (follow_target != noone && !immobilized) {
    
    var _dist = point_distance(follow_target.x, follow_target.y, x, y);
    if (_dist > follow_max_distance) {
        //stop
        show_debug_message($"Stop follow")
        if (do_stop_follow) {
            set_follow_target(noone);
            target_x = x;
            target_y = y;
        }
    } else {
        show_debug_message($"Moving follow")
        var _dir = point_direction(follow_target.x, follow_target.y, x, y);
        var _dx = lengthdir_x(16, _dir);
        var _dy = lengthdir_y(16, _dir);
        target_x = follow_target.x+_dx;
        target_y = follow_target.y+_dy;
        
        npc_move_towards_point(target_x, target_y);
    }
}
