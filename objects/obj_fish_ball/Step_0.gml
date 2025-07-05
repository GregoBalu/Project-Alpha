if (following_path) {
    image_angle += 2;
    exit;
}
    
if (distance_to_point(target.x, target.y) < 5) {
    generate_new_target();
}

var _dx = target.x - x;
var _dy = target.y - y;
//var _len = point_distance(x, y, target.x, target.y);


//move_and_collide(_dx, _dy, , undefined, undefined, undefined, current_speed, current_speed);
move_towards_point(target.x, target.y, 1);

if (collision_circle(x, y, sprite_width/2, obj_fish_target, true, true)) {
    var _dir = point_direction(x, y, obj_fish_target.x, obj_fish_target.y);
    obj_fish_target.x += lengthdir_x(1, _dir);
    obj_fish_target.y += lengthdir_y(1, _dir);
}