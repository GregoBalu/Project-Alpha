


function spawn_effect(_sprite, _x, _y, _w, _h, _depth, _dir, _speed, _life_seconds, _splash_sprite = noone, _splash_seconds = 0) {
    return instance_create_layer(_x, _y, "Instances", obj_effect, {
        sprite_index : _sprite,
        target_width : _w,
        target_height : _h,
        depth : _depth,
        move_direction : _dir,
        move_speed : _speed,
        life_seconds : _life_seconds,
        splash_image : _splash_sprite,
        splash_seconds : _splash_seconds
    });
}














