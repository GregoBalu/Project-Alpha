draw_shadow();

draw_self();

if (see_player) {
    
    var _scale_x = clamp((sprite_width / 16), 0.5, 2.0);
    var _scale_y = clamp((sprite_height / 16), 0.5, 2.0);
    
    var _dot_w = 2 * _scale_x;
    var _dot_h = 2 * _scale_y;
    var _dot_x = x - 1;
    var _dot_y = y - (sprite_height/2);
    
    var _w = 3 * _scale_x;
    var _h = 6 * _scale_y;
    var _y = _dot_y - _dot_h - _h/2;
    
    draw_ellipse_color(_dot_x - _dot_w/2, _dot_y + _dot_h/2, _dot_x + _dot_w/2, _dot_y - _dot_h/2, c_orange, c_orange, false);
    
    draw_ellipse_color(_dot_x - _w/2, _y + _h/2, _dot_x + _w/2, _y - _h/2, c_orange, c_orange, false);
}
