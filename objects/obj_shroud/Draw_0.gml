if (debug_level > 0) {
    /*var _orig_gui_w = display_get_gui_width();
    var _orig_gui_h = display_get_gui_height();
    display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
    var orig_alpha = draw_get_alpha();
    draw_set_alpha(1);
    
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
    
    show_debug_message($"debug list size={ds_list_size(debug_sc_list)}")
    for (var _i = 0; _i < ds_list_size(debug_sc_list);_i++) {
        
        var _item = debug_sc_list[|_i];
        //show_debug_message($"{_item}")
        
        var _color = c_red;
        if (!_item[3]) {
            _color = c_green;
        }
        draw_circle_color(_item[0], _item[1], _item[2], _color, _color, false);
        
    }
    
    //draw_set_alpha(orig_alpha);
    //display_set_gui_size(_orig_gui_w, _orig_gui_h);*/
}

if (FOG_ON && !is_gui) {
    //display_set_gui_size(cam_w, cam_h);
    
    /*if (!changed) {
        if (surface_exists(my_surf)) {
            draw_surface(my_surf, 0, 0);
        }
        display_set_gui_size(_orig_gui_w, _orig_gui_h);
        exit;
    } else {
        if (surface_exists(my_surf)) {
            surface_free(my_surf);
            my_surf = undefined;
        }
    }*/
    
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    var _sgrid_start_x = _cam_x div real_grid_size_w;
    var _sgrid_start_y = _cam_y div real_grid_size_h;
    
    var _off_x = (_sgrid_start_x * real_grid_size_w);//pixels X between grid TL and room TL
    var _off_y = (_sgrid_start_y * real_grid_size_h);//pixels Y between grid TL and room TL
    
    var _sgrid_width = ds_grid_width(shroud_grid);
    var _sgrid_height = ds_grid_height(shroud_grid);
    
    var _box_width = (real_grid_size_w );
    var _box_height = (real_grid_size_h );
    
    //show_debug_message($"Shroud draw cam={_cam_x},{_cam_y} sgrid={_sgrid_start_x},{_sgrid_start_y} off={_off_x},{_off_y} ");
    
    /*if (!surface_exists(my_surf)) {
        my_surf = surface_create(surf_w, surf_h);
        //draw_clear_alpha(c_black, 0);
    } else {
        
    }*/
    
    //surface_
    
    //surface_set_target(my_surf);
    //draw_set_color(c_black);
    
    var _sprite = spr_black_16;
    
    var _rx = _off_x;
    var _ry = _off_y;
    for (var _r = 0; _r < cam_cell_width; _r++)
    {
        var _sgrid_r = _sgrid_start_x + _r;
        _ry = _off_y;
        for (var _c = 0; _c < cam_cell_height; _c++)
        {
            var _sgrid_c = _sgrid_start_y + _c;
            if (_sgrid_r >= _sgrid_width || _sgrid_c >= _sgrid_height) {
                _ry += real_grid_size_h;
                continue;
            }
            var _s = shroud_grid[# _sgrid_r, _sgrid_c];
            if (_s > 0) {
                //draw_set_alpha(_s);
                //var _rx = (_r * grid_size) + _off_x; //optimized out to bunch of addition around the cycle
                //var _ry = (_c * grid_size) + _off_y;
                //draw_rectangle(_rx, _ry, _rx + _box_width-1, _ry + _box_height-1, false);
                //show_debug_message($"Draw shroud {_rx},{_ry} - {_box_width},{_box_height}");
                draw_sprite_stretched_ext(_sprite, 0, _rx, _ry, _box_width, _box_height, c_white, _s);
                /*if (debug_level > 0) {
                    draw_text_transformed_color(_rx, _ry, _s.debug, 0.25, 0.25, 0, c_red, c_red, c_red, c_red, _s.alpha);
                }*/
            }
            _ry += real_grid_size_h;
        }
        _rx += real_grid_size_w;
    }
    /*surface_reset_target();
    
    draw_surface(my_surf, _off_x, _off_y);
    
    surface_free(my_surf);
    my_surf = undefined;*/
    
    //draw_set_alpha(1);
    
    
    if (debug_level > 0) {
        //display_set_gui_size(640, 384);
        
        var _dx = camera_get_view_x(view_camera[0]);
        var _dy = camera_get_view_y(view_camera[0]);
        //display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
        //show_debug_message($"debug list size={ds_list_size(debug_sc_list)}")
        /*for (var _i = 0; _i < ds_list_size(debug_sc_list);_i++) {
            
            var _item = debug_sc_list[|_i];
            //show_debug_message($"{_item}")
            
            var _color = c_red;
            if (!_item[3]) {
                _color = c_green;
            }
            
            draw_circle_color(_item[0]-_dx, _item[1]-_dy, _item[2], _color, _color, false);
            
        }*/
        if (debug_bfs_max_dist > 0) {
            var _color_step = 255 / debug_bfs_max_dist;
            
            draw_set_alpha(0.5);
            for (var _i = 0; _i < ds_list_size(debug_bfs_list); _i++)
            {
                var _item = debug_bfs_list[|_i];
                var _color = make_color_rgb(_item[2]*_color_step, 0, (debug_bfs_max_dist-_item[2])*_color_step);
                
                draw_circle_color(_item[0]-_dx, _item[1]-_dy, grid_size/4, _color, _color, false);
            }
            draw_set_alpha(1);
            }
    }
    
    
    
    //display_set_gui_size(_orig_gui_w, _orig_gui_h);
}