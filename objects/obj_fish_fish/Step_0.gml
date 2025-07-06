if (!enabled) {
    speed = 0;
    exit;
}

--timer;
if (timer <= 0) {
    obj_fish_manager.fishGotAway();
    instance_destroy();
    exit;
}

if (distance_to_point(target.x, target.y) < 5) {
    generate_new_target();
}

var _dx = target.x - x;
var _dy = target.y - y;
//var _len = point_distance(x, y, target.x, target.y);


//move_and_collide(_dx, _dy, , undefined, undefined, undefined, current_speed, current_speed);
move_towards_point(target.x, target.y, current_speed);

part_system_position(particle_system, x, y);
if (_dx >= 0) {
    image_xscale = 1;
} else {
    image_xscale = -1;
}
