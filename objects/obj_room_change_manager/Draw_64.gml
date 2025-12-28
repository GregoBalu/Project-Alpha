var _width = display_get_gui_width();
var _height = display_get_gui_height();

if (effect == RoomTransition.Fade && effectData.progress > 0) {
    draw_set_colour(c_black);
    draw_set_alpha(effectData.progress/100);
    draw_rectangle(0, 0, _width, _height, false);
    draw_set_alpha(1);
} else if (effect == RoomTransition.Spiral && effectData.progress > 0) {
    
    var _progress_norm = effectData.progress/100;
    var _scale = .5 +  _progress_norm;
    var _w = _width * _scale;
    var _h = _height * _scale;
    var _center_x = _width/2;
    var _center_y = _height/2;
    var _x = _center_x - _w/2;
    var _y = _center_y - _h/2;
    var _spr_w = sprite_get_width(spr_effect_swirl);
    var _spr_h = sprite_get_height(spr_effect_swirl);
    
    var _actual_w_scale = _w / _spr_w;
    var _actual_h_scale = _h / _spr_h;
    
    var _circle_limit = 50;
    if (effectData.progress > _circle_limit) {
        var _alpha = 1 - ( (100 - effectData.progress) / (100-_circle_limit) ); //100-75
        if (_alpha > 0.9) {
            _alpha = 1;
        }
        draw_set_alpha(_alpha);
        draw_circle_colour(_center_x, _center_y, (_width*0.8)*_alpha, c_gray, c_black, false);
        draw_set_alpha(1);
    }
    
    var _sprite_alpha = clamp(.2 + _progress_norm, 0, 1);
    if (_sprite_alpha > 0.9) {
        _sprite_alpha = 1;
    }
    draw_sprite_ext(spr_effect_swirl, effectData.subimg, _x, _y, _actual_w_scale, _actual_h_scale, 0, c_gray, _sprite_alpha );
    
}