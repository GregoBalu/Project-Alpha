// Inherit the parent event
event_inherited();

image_index = 0;
original_image_speed = image_speed;
image_speed = 0;

zapping = false;
zap_length = 32;
if (zapping) {
    image_speed = original_image_speed;
} else {
    image_index = 0;
    image_speed = 0;
}
zap_frequency = 0.5*TIME_SECOND;
zapped_by = noone;
zapped = ds_list_create();
paths = ds_list_create();
zapping_audio = noone;

alarm[2] = zap_frequency;

toggle_zap = function(_id) {
    zapping = !zapping;
    
    if (zapping) {
        image_speed = original_image_speed;
        zapped_by = _id;
    } else if (_id == zapped_by) {
        image_index = 0;
        image_speed = 0;
        clear_zapped();
        zapped_by = noone;
    }
}

create_path = function(_x, _y) {
    
    var _path = path_add();
    path_set_kind(_path, 0);
    path_set_closed(_path, false);
    
    path_add_point(_path, x, y, 1);
    
    var prev_point = new Vec2(x, y);
    
    var _dir = point_direction(x, y, _x, _y);
    var _len = point_distance(x, y, _x, _y);
    if (_len > 16) {
        var _adir = random_range(_dir-45, _dir+45);
        var _p = new Vec2(prev_point.x + lengthdir_x(16, _adir), prev_point.y + lengthdir_y(16, _adir));
        path_add_point(_path, _p.x, _p.y, 1);
        prev_point = _p;
    }
    if (_len > 32) {
        var _adir = random_range(_dir-45, _dir+45);
        var _p = new Vec2(prev_point.x + lengthdir_x(16, _adir), prev_point.y + lengthdir_y(16, _adir));
        path_add_point(_path, _p.x, _p.y, 1);
        prev_point = _p;
    }
    
    path_add_point(_path, _x, _y, 1);
    
    return _path;
}