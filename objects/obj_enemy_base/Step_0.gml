if (instance_exists(obj_dialog) || instance_exists(obj_vendor)) exit;
    
if (global.do_pause) exit;

if (player_close && wander_range > 0 && move_speed > 0 && !immobilized) {
    if (path_index == -1) {
        var _path = path_add();
        if (mp_grid_path(global.mp_grid, _path, x, y, target_x, target_y, true)) {
            MOVING = true;
            if (DEBUG) {
                show_debug_message($"Pathing...");
            }
            path_start(_path, move_speed, path_action_stop, false);
            using_path = true;
        } else {
            using_path = false;
            var _hor = clamp(target_x - x, -1, 1);
            var _ver = clamp(target_y - y, -1, 1);
            
            if (DEBUG) {
                show_debug_message($"oldstyle moving...");
            }
            
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

if (MOVING && ds_list_size(particles) > 0) {
    for (var _i = 0; _i < ds_list_size(particles); ++_i)
    {
        part_system_position(particles[|_i].ps, x, y);
        part_system_depth(particles[|_i].ps, depth-1);
    }
}

if (hp <= 0) {
    if (DEBUG) show_debug_message("enemy dead");
    obj_loottable.generate_loot(self);
    obj_player.gain_experience(self);
    instance_destroy();
    exit;
}

//scale enemy up with player a bit to be more exciting/challenging
if (scale_level < obj_player.level) {
    var level_up = obj_player.level - scale_level;
    scale_level = obj_player.level;
    var scale_amt = (1+0.1*level_up);
    if (DEBUG) show_debug_message($"Enemy scaled up: {scale_amt}");
    hp = hp*scale_amt;
    hp_total = hp_total*scale_amt;
    damage = damage*scale_amt;
    
}