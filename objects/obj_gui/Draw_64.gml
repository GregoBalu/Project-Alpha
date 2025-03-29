display_set_gui_size(640, 480);

draw_set_font(font_base);

var _x = 20;
var _y = 375;
var _margin = 5;
var _width = 25;
var _height = 25;

var _padding = 5;

//draw_sprite_stretched(spr_button, 0, _x, _y, 20, 20);

function draw_button_hint(_x, _y, _width, _height, _padding, _key){
    draw_sprite_stretched(spr_button, keyboard_check(_key)?2:0, _x, _y, _width, _height);
    draw_textbox_color(_x+(_width/2), _y+(_height/2), _width-2*_padding, _height-2*_padding, key2str(_key), c_black, fa_center, fa_middle) ;
}

draw_button_hint(_x, _y, _width, _height, _padding, global.input_pause);

_y += _height + _margin;

draw_button_hint(_x, _y, _width, _height, _padding, global.input_playersheet);
_y += _height + _margin;
draw_button_hint(_x, _y, _width, _height, _padding, global.input_sprint);

_x += 2*(_width + _margin);


_y = 405;
draw_button_hint(_x + _width + _margin, _y, _width, _height, _padding, global.input_up);
_y += _height + _margin;
draw_button_hint(_x, _y, _width, _height, _padding, global.input_left);
draw_button_hint(_x + _width + _margin, _y, _width, _height, _padding, global.input_down);
draw_button_hint(_x + _width + _margin + _width + _margin, _y, _width, _height, _padding, global.input_right);

if (show_use > 0) {
    draw_button_hint(_x +4*(_width+_margin), _y, _width, _height, _padding, global.input_use);
}

if (show_corruption > 0) {
    
    var _corr_w = 24*2;
    var _corr_h = 64*3;
    draw_sprite_stretched(spr_corruption, clamp(9*show_corruption, 0, 8), 640 - 10 - _corr_w, 10, _corr_w, _corr_h);
}
