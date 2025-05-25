if (prev_frame_collision && cd_to_teleport > 0 && cd_to_teleport < teleport_at_frames) {
    var _color = c_aqua;
    
    var _progress = cd_to_teleport / teleport_at_frames;
    var _w = display_get_gui_width();
    //var _w2 = _w/2;
    var _roomw = camera_get_view_width(obj_camera.cam);
    var _roomw2 = _roomw / 2;
    var _room2gui_x = _w/_roomw;
    
    var _h = display_get_gui_height();
    //var _h2 = _h/2;
    var _roomh = camera_get_view_height(obj_camera.cam);
    var _roomh2 = _roomh / 2;
    var _room2gui_y = _h/_roomh;
    
    if (_progress > 0.9) {
        draw_set_alpha(1.0*_progress);
        draw_rectangle_color(0, 0, _w, _h, _color, _color, _color, _color, false);
        effect_ramp_down = _progress;
        draw_set_alpha(1);
        exit;
    }
    
    var _actualW = 1.5*_w*clamp(_progress, 0.5, 1.0);
    var _x = (_w - _actualW)/2;
    if (obj_player.x < _roomw2) {
        _x += (obj_player.x - _roomw2)*_room2gui_x;
    }

    var _actualH = 1.5*_h*clamp(_progress, 0.5, 1.0);
    var _y = (_h - _actualH) / 2;
    if (obj_player.y < _roomh2) {
        _y += (obj_player.y - _roomh2)*_room2gui_y;
    }
    
    draw_sprite_stretched_ext(spr_effect_swirl, effect_index div 6, _x, _y, _actualW, _actualH, _color, 0.8*_progress);
} else if (effect_ramp_down > 0) {
    var _color = c_aqua;
    
    var _w = display_get_gui_width();
    var _h = display_get_gui_height();
    
    draw_set_alpha(1.0*effect_ramp_down);
    draw_rectangle_color(0, 0, _w, _h, _color, _color, _color, _color, false);
    draw_set_alpha(1);
    effect_ramp_down -= 0.1;
}