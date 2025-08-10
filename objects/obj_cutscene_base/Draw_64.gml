var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

var _h = _gh*0.1;

draw_rectangle_color(0, 0, _gw, _h, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(0, _gh-_h, _gw, _gh, c_black, c_black, c_black, c_black, false);