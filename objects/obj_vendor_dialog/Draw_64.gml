var _orig_w = display_get_gui_width();
var _orig_h = display_get_gui_height();

display_set_gui_size(vendor_w, vendor_h);

draw_set_alpha(0.3);
draw_rectangle_colour(0, 0, vendor_w, vendor_h, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

var _x = 100;
var _y = 70;

draw_sprite(sprite_index, image_index, _x, _y);

draw_textbox(_x + 10, _y + 9, 80, 27, self.dialog_text);

//10, 37 cancel
cancel_subimg = 0;
if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x+10, _y+37, _x+25, _y+52)) {
    draw_sprite_stretched_ext(spr_vendor_sell_highlighted, 0, _x+10, _y+37, 16, 16, c_black, 0.3);
    cancel_subimg = 1;
    if (mouse_check_button(mb_left)) {
        cancel_subimg = 2;
    } else if (mouse_check_button_released(mb_left)) {
        cancel();
        return;
    }
}
draw_sprite(spr_vendor_dialog_cancel, cancel_subimg, _x+10, _y+37);

//74, 37 accept
accept_subimg = 0;
if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x+74, _y+37, _x+89, _y+52)) {
    draw_sprite_stretched_ext(spr_vendor_sell_highlighted, 0, _x+74, _y+37, 16, 16, c_black, 0.3);
    accept_subimg = 1;
    if (mouse_check_button(mb_left)) {
        accept_subimg = 2;
    } else if (mouse_check_button_released(mb_left)) {
        accept();
        return;
    }
}
draw_sprite(spr_vendor_dialog_accept, accept_subimg, _x+74, _y+37);


display_set_gui_size(_orig_w, _orig_h);