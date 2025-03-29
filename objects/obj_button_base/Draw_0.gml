
//draw_sprite_stretched(spr_button, 0, x, y, width, height);

text_color = c_black;
if (state == ButtonState.Normal) {
    text_color = c_black;
    image_index = 0;
} else if (state == ButtonState.Pressed) {
    text_color = c_white;
    image_index = 2;
} else if (state == ButtonState.Hover) {
    text_color = c_black;
    image_index = 1;
}

draw_self();

var _margin = 8;

var _wrad = (width -2*_margin) / 2;
var _hrad = (height -2*_margin) / 2;

var _x = x + _margin + _wrad - 1;
var _y = y + _margin + _hrad - 1;

var _w = 2*_wrad;
var _h = 2*_hrad;

var defFont = draw_get_font();
draw_set_font(font_menu);
draw_textbox_color(_x, _y, _w, _h, text, text_color, fa_center, fa_middle);


draw_set_font(defFont);
draw_set_color(c_white);
