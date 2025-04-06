if (!is_on || paused) exit;




//if (point_in_rectangle(obj_player.x, obj_player.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom-8, obj_player, false, true)) {
    if (!is_in_use) {
        is_in_use = true;
        
        alarm[0] = BOOST_TICK;
    }
    
    obj_player.x += lengthdir_x(current_force, force_direction);
    obj_player.y += lengthdir_y(current_force, force_direction);
    
} else {
    if (is_in_use) {
        is_in_use = false;
        current_force = force;
        arrow_fps = 6;
        boost_percent = 0;
        alarm[0] = -1;
        //show_debug_message("Reset");
    }
}

arrow_fps = default_arrow_fps * (1+boost_percent);
arrow_subimg = (arrow_subimg + (delta_time/1000000)*arrow_fps) mod 4;

