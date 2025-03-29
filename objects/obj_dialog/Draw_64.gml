display_set_gui_size(gui_w, gui_h);

var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

draw_sprite_stretched(spr_box, 0, _dx, _dy, _boxw, _boxh);

_dx += 16;
_dy += 16;

draw_set_font(font_base);
var _name = messages[current_message].name;
draw_set_color(messages[current_message].color);
draw_text(_dx, _dy, _name);
draw_set_color(c_black);

_dx += 4;
_dy += 40;

draw_set_color(messages[current_message].msg_color);
draw_set_font(messages[current_message].msg_font);
draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx*2);

draw_set_font(font_base);
draw_set_color(c_ltgray);

if (has_more) {
    var _tpad = 8;
    var _tw = 8;
    var _th = 7;
    var _tx = _boxw - _tpad - _tw;
    var _ty = gui_h - _tpad - _th;
    
    draw_triangle(_tx, _ty, _tx + _tw, _ty, _tx+_tw/2, _ty+_th, false);
} else if (at_end) {
    var _pad = 8;
    draw_circle(_boxw - _pad - 4, gui_h - _pad - 4, 4, false);
}

draw_set_color(c_black);