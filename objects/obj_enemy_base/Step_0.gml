if (instance_exists(obj_dialog)) exit;

if (wander_range > 0 && move_speed > 0) {
    if (path_index == -1) {
        var _path = path_add();
        if (mp_grid_path(global.mp_grid, _path, x, y, target_x, target_y, true)) {
            path_start(_path, move_speed, path_action_stop, false);
        } else {
            var _hor = clamp(target_x - x, -1, 1);
            var _ver = clamp(target_y - y, -1, 1);
            
            var colls = array_concat(collision_array, [obj_enemy_base]);
            move_and_collide(_hor * move_speed, _ver * move_speed, colls, undefined, undefined, undefined, move_speed, move_speed);
            if (_hor != 0 || _ver != 0) {
                MOVING = true;
            } else {
                MOVING = false;
            }
        }
    }
    
    
} else {
    MOVING = false;
}

if (hp <= 0) {
    show_debug_message("enemy dead");
    obj_loottable.generate_loot(self);
    obj_player.gain_experience(self);
    instance_destroy();
}