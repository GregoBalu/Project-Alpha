// Inherit the parent event
event_inherited();

if (follow_target != noone) {
    
    var _dist = point_distance(follow_target.x, follow_target.y, x, y);
    if (_dist > 92) {
        //stop
        if (do_reset_follow) {
            set_follow_target(noone);
        }
    } else {
        var _dir = point_direction(follow_target.x, follow_target.y, x, y);
        var _dx = lengthdir_x(16, _dir);
        var _dy = lengthdir_y(16, _dir);
        
        npc_move_towards_point(follow_target.x+_dx, follow_target.y+_dy);
    }
}
