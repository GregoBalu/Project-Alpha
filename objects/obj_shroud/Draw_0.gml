if (debug_level > 0) {
    //var _orig_gui_w = display_get_gui_width();
    //var _orig_gui_h = display_get_gui_height();
    //display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
    //var orig_alpha = draw_get_alpha();
    //draw_set_alpha(1);
    
    for (var i = 0; i < ds_list_size(debug_list); i++)
    {
        var debug_data = debug_list[| i];
        
        if (debug_level == 1 && (debug_data.has_collision || debug_data.has_collider) )
            continue;
        if (debug_level == 2 && debug_data.visible )
            continue;
        if (debug_level == 3 && (!debug_data.has_collision || !debug_data.has_collider))
            continue;
        
        draw_circle_color(debug_data.start_x, debug_data.start_y, 1, c_red, c_red, false);
        draw_line_color(debug_data.start_x, debug_data.start_y, debug_data.end_x, debug_data.end_y, c_red, c_red);
        
        var endColor = c_green;
        if (debug_data.visible) {
            endColor = c_green
        } else {
            endColor = c_red;
        }
        draw_circle_color(debug_data.end_x, debug_data.end_y, 2, endColor, c_green, false);
        draw_line(debug_data.end_x, debug_data.end_y - 8, debug_data.end_x, debug_data.end_y + 8);
        draw_line(debug_data.end_x -8, debug_data.end_y, debug_data.end_x +8, debug_data.end_y);
        if (debug_data.has_collision) {
            draw_circle_color(debug_data.coll_x, debug_data.coll_y, 2, c_yellow, c_yellow, false);
        }
        //if (debug_data.end_x != debug_data.orig_end_x && debug_data.end_y != debug_data.orig_end_y) {
            draw_set_color(c_black);
            draw_arrow(debug_data.orig_end_x, debug_data.orig_end_y, debug_data.end_x, debug_data.end_y, 2);
            draw_set_color(c_black);
        //}
    }
    for (var i = 0; i < ds_list_size(debug_points); i++) {
        draw_circle_color(debug_points[| i].x, debug_points[| i].y, 1.5, c_yellow, c_yellow, true);
    }
    
    
    //draw_set_alpha(orig_alpha);
    //display_set_gui_size(_orig_gui_w, _orig_gui_h);
}