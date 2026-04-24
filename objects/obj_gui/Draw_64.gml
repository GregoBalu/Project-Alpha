if (room == rm_end) exit;
if (instance_exists(obj_dialog) || instance_exists(obj_vendor)) exit;

display_set_gui_size(640, 480);
draw_set_font(font_base);

var _doDrawHint = false;
var _hint_text = "";

var _x = 20;
var _y = 375;
var _margin = 5;
var _width = 25;
var _height = 25;

var _padding = 5;

//draw_sprite_stretched(spr_button, 0, _x, _y, 20, 20);

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

if (show_talk > 0) {
    draw_button_hint(_x +5*(_width+_margin), _y, _width*2, _height, _padding, global.input_talk);
}

if (show_corruption > 0) {
    
    var _corr_w = 24*2;
    var _corr_h = 64*3;
    var _corr_x = 640 - 10 - _corr_w;
    var _corr_y = 10;
    draw_sprite_stretched(spr_corruption, clamp(9*show_corruption, 0, 8), _corr_x, _corr_y, _corr_w, _corr_h);
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _corr_x, _corr_y, _corr_x+_corr_w-1, _corr_y+_corr_h-1)) {
        _doDrawHint = true;
        _hint_text = string(getText("Corruption_progress"), show_corruption*100);
    }
}

if (show_fps) {
    _x = 16;
    _y = 16;
    draw_rectangle_color(_x, _y, _x+80, _y+24, c_white, c_white, c_white, c_white, false);
    draw_text_transformed(_x+2, _y, "FPS = " + string(fps), 1, 1, 0);
}

if (_doDrawHint) {
    var _halign = fa_left;
    var _valign = fa_top;
    //var _margin = 8;
    var _hint_x = mouse_gui_x+_margin;
    var _hint_y = mouse_gui_y+_margin
    if (mouse_gui_x > 320) {
        _halign = fa_right;
        _hint_x = mouse_gui_x-_margin;
    }
    if (mouse_gui_y > 240) {
        _valign = fa_bottom;
        _hint_y = mouse_gui_y-_margin;
    }
    draw_textbox_background(_hint_x, _hint_y, 100, 100, _hint_text, new BackgroundData(spr_gui_back, 0, _margin), _halign, _valign, undefined, 0.6);
}