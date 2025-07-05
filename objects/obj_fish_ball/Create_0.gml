
path = path_add();
path_set_kind(path, 1);
path_set_closed(path, false);
var _side_start = random_range(0,1);
if (_side_start < 0.25) {
    path_add_point(path, 0, random_range(0, room_height), 100);
} else if (_side_start < 0.5) {
    path_add_point(path, room_width, random_range(0, room_height), 100);
} else if (_side_start < 0.75) {
    path_add_point(path, random_range(0, room_height), 0, 100);
} else {
    path_add_point(path, random_range(0, room_height), room_height, 100);
}
path_add_point(path, x, y, 200);
following_path = true;
path_start(path, 100, path_action_stop, true);

target = new Vec2(0, 0);

generate_new_target = function() {
    delete target;
    target = new Vec2(random_range(obj_fish_manager.room_margin, room_width-obj_fish_manager.room_margin), random_range(obj_fish_manager.room_margin, room_height-obj_fish_manager.room_margin));
}

generate_new_target();

alarm[0] = life;