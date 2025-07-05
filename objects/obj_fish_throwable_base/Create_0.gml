//Throw side: 0-left, 1-right, 2-top, 3-bottom

path = path_add();
path_set_kind(path, 1);
path_set_closed(path, false);
var _side_start = (throw_side==-1)?floor(random_range(0,3.99)):throw_side;
var entry_point;
if (_side_start < 1) {
    entry_point = new Vec2(0, random_range(0.2*room_height, 0.8*room_height));
} else if (_side_start < 2) {
    entry_point = new Vec2(room_width, random_range(0.2*room_height, 0.8*room_height));
} else if (_side_start < 3) {
    entry_point = new Vec2(random_range(0.2*room_width, 0.8*room_width), 0);
} else {
    entry_point = new Vec2(random_range(0.2*room_width, 0.8*room_width), room_height);
}
path_add_point(path, entry_point.x, entry_point.y, 2*throw_speed);
path_add_point(path, random_range(entry_point.x, target_x), random_range(entry_point.y, target_y), 1*throw_speed);


path_add_point(path, target_x, target_y, 1.5*throw_speed);
following_path = true;
path_start(path, 100, path_action_stop, true);
delete entry_point;
image_alpha = 0.8;

onPathEnd = function() {
    
}