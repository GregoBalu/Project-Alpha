if (paused) {
    exit;
}

if (!can_start) {
    y += 1;
    var _fall_progress = ((ystart-y)/32);
    image_xscale = 1 + _fall_progress*0.5;
    image_yscale = 1 + _fall_progress*0.5;
    
    if (y == ystart) {
        if (distance_to_object(obj_player) <= 150 && collision_line(x, y, obj_player.x, obj_player.y, no_see_tilemaps, false, true) == noone) {
            screenshake(0,0.5*TIME_SECOND, 3, 0.9);
        }
        can_start = true;
    }
    
    exit;
}

if (at_end) {
    exit;
}

var _len = point_distance(x, y, xstart, ystart);
if (_len >= path_distance) {
    at_end = true;
    if (distance_to_object(obj_player) <= 80 && collision_line(x, y, obj_player.x, obj_player.y, no_see_tilemaps, false, true) == noone) {
        sprite_index = spr_indiana_ball_splash;
        image_index = 0;
        screenshake(0, 0.5*TIME_SECOND, 2, 1);
        alarm[1] = 0.5*TIME_SECOND;
    } else {
        alarm[1] = random_range(0.5, 1)*TIME_SECOND;
    }
    exit;
}

x += lengthdir_x(ball_speed/TIME_SECOND, path_direction);
y += lengthdir_y(ball_speed/TIME_SECOND, path_direction);

