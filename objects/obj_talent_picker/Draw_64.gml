
var _width = display_get_gui_width();
var _height = display_get_gui_height();

draw_sprite_stretched(spr_gui_back, 0, _width*0.2, _height*0.2, _width*0.6, _height*0.6);

var _gap_w = max(_width*0.02, 12);
var _gap_w2 = _gap_w/2;
var _gap_h = max(_height*0.1, 12);
var _gap_h2 = _gap_h/2;
var _x = _width*0.2 + _gap_w2;
var _y = _height*0.2 + _gap_h2;
var _picker_w = _width*0.2 - _gap_w;
var _picker_h = _height*0.6 - _gap_h;

var _image_offset_x = _picker_w/4;
var _image_offset_y = _picker_h*0.14;

if (talent1 != noone) {
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_picker_w, _y+_picker_h) ) {
        draw_sprite_stretched_ext(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h, c_ltgray, 1);
        if (mouse_check_button_pressed(mb_left)) {
            talent1.action();
            instance_destroy();
            exit;
        }
        //draw_textbox_background(mouse_gui_x, mouse_gui_y, _picker_w, _picker_h, talent1.hint, new BackgroundData(spr_hint_back, 0, 5));
    } else {
        draw_sprite_stretched(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h);
    }
    draw_sprite_stretched(talent1.sprite_index, talent1.image_index, _x+_image_offset_x, _y+_image_offset_y, _picker_w*0.5, _picker_h*0.5);
    var _spr = spr_talent_cost_1;
    if (talent1.cost_amount == 1) {
        _spr = spr_talent_cost_1;
    } else if (talent1.cost_amount == 2) {
        _spr = spr_talent_cost_2;
    } else if (talent1.cost_amount == 3) {
        _spr = spr_talent_cost_3;
    }
    draw_sprite_stretched(_spr, 0, _x+_picker_w*0.135, _y+_picker_h*0.735, _picker_w*0.15, _picker_h*0.14);
}

_x += _picker_w+_gap_w;
if (talent2 != noone) {
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_picker_w, _y+_picker_h) ) {
        draw_sprite_stretched_ext(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h, c_ltgray, 1);
        if (mouse_check_button_pressed(mb_left)) {
            talent2.action();
            instance_destroy();
            exit;
        }
    } else {
        draw_sprite_stretched(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h);
    }
    draw_sprite_stretched(talent2.sprite_index, talent2.image_index, _x+_image_offset_x, _y+_image_offset_y, _picker_w*0.5, _picker_h*0.5);
}

_x += _picker_w+_gap_w;
if (talent3 != noone) {
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_picker_w, _y+_picker_h) ) {
        draw_sprite_stretched_ext(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h, c_ltgray, 1);
        if (mouse_check_button_pressed(mb_left)) {
            talent3.action();
            instance_destroy();
            exit;
        }
    } else {
        draw_sprite_stretched(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h);
    }
    draw_sprite_stretched(talent3.sprite_index, talent3.image_index, _x+_image_offset_x, _y+_image_offset_y, _picker_w*0.5, _picker_h*0.5);
}
