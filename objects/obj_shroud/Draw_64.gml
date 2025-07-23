if (FOG_ON) {
    
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    var _pos_x = _cam_x div grid_size;
    var _pos_y = _cam_y div grid_size;
    
    var _off_x = (_pos_x * grid_size) - _cam_x;
    var _off_y = (_pos_y * grid_size) - _cam_y;
    
    var _sgrid_width = ds_grid_width(shroud_grid);
    var _sgrid_height = ds_grid_height(shroud_grid);
    
    var _box_width = (grid_size );
    var _box_height = (grid_size );
 
    var _orig_gui_w = display_get_gui_width();
    var _orig_gui_h = display_get_gui_height();
    display_set_gui_size(cam_w, cam_h);
    
    /*if (!surface_exists(my_surf)) {
        my_surf = surface_create(cam_w, cam_h);
    }
    
    surface_
    
    surface_set_target(my_surf);*/
    //draw_set_color(c_black);
    
    for (var _r = 0; _r < cam_cell_width; _r++)
    {
        for (var _c = 0; _c < cam_cell_height; _c++)
        {
            if (_pos_x + _r >= _sgrid_width || _pos_y + _c >= _sgrid_height) {
                continue;
            }
            var _s = shroud_grid[# _pos_x + _r, _pos_y + _c];
            if (_s > 0) {
                //draw_set_alpha(_s);
                var _rx = (_r * grid_size) + _off_x;
                var _ry = (_c * grid_size) + _off_y;
                //draw_rectangle(_rx, _ry, _rx + _box_width, _ry + _box_height, false);
                draw_sprite_stretched_ext(spr_black_16, 0, _rx, _ry, _box_width, _box_height, c_white, _s);
                /*if (debug_level > 0) {
                    draw_text_transformed_color(_rx, _ry, _s.debug, 0.25, 0.25, 0, c_red, c_red, c_red, c_red, _s.alpha);
                }*/
            }
        }
    }
    
    /*surface_reset_target();
    
    draw_surface(my_surf, 0, 0);*/
    
    //draw_set_alpha(1);
    display_set_gui_size(_orig_gui_w, _orig_gui_h);
}
