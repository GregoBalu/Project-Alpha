if (!is_on || paused) exit;


arrow_subimg = (arrow_subimg + (delta_time/1000000)*6) mod 4;

//if (point_in_rectangle(obj_player.x, obj_player.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom-8, obj_player, false, true)) {
    if (!is_in_use) {
        is_in_use = true;
        use_start_time = get_timer();
    } else if (!is_boosted) {
        var _ct = get_timer();
        if ( ((_ct - use_start_time)/1000) > (force_boost_delay_sec*1000) ) {
            is_boosted = true;
            show_debug_message("Boost!");
        }
    }
    
    obj_player.x += lengthdir_x(is_boosted?force_boost:force, force_direction);
    obj_player.y += lengthdir_y(is_boosted?force_boost:force, force_direction);
    
} else {
    if (is_in_use) {
        is_in_use = false;
        is_boosted = false;
        show_debug_message("Reset");
        var _end_time = get_timer();
    }
}


