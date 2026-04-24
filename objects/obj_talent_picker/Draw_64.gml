display_set_gui_size(320, 180);
draw_set_font(font_base);

var _width = 300;
var _height = 172;

var _left = 10;
var _top = 4;
var _right = _left + _width - 1; 
var _bottom = _top + _height - 1;

var _x = _left;
var _y = _top;

draw_sprite_stretched(spr_gui_back, 0, _x, _y, _width, _height);
_y += 4;
draw_textbox(160, _y, 80, 10, title, fa_center, fa_top);
_y += 10;
draw_textbox(160, _y, 80, 10, $"{talent_power_label}: {obj_player.talent_points}", fa_center, fa_top);

var _gap_w = 16;
var _gap_w2 = 8;
var _gap_h = 16;
var _gap_h2 = 8;
_x += _gap_w2;
_y += 10;
var _picker_w = (_width/3) - _gap_w; //84;
var _picker_h = 112; //112;

var _image_offset_x = 17;
var _image_offset_y = 17;
var _image_w = 50;
var _image_h = 50;

var _cost_offset_x = 12;
var _cost_offset_y = 82;
var _cost_w = 18;
var _cost_h = 18;

var _type_offset_x = 60;
var _type_offset_y = 64;
var _type_w = 14;
var _type_h = 14;
var _type_alpha = 0.8;

var _doDrawHint = false;
var _hint_text = "";

function getCostSpr(tal) {
    var _spr = spr_talent_cost_0;
    if (tal.cost_amount == 1) {
        _spr = spr_talent_cost_1;
    } else if (tal.cost_amount == 2) {
        _spr = spr_talent_cost_2;
    } else if (tal.cost_amount == 3) {
        _spr = spr_talent_cost_3;
    }
    return _spr;
}

if (talent1 != noone) {
    var _spr = getCostSpr(talent1);
    draw_sprite_stretched(_spr, 0, _x+_cost_offset_x, _y+_cost_offset_y, _cost_w, _cost_h);
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_picker_w, _y+_picker_h) ) {
        draw_sprite_stretched_ext(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h, c_ltgray, 1);
        if (mouse_check_button_pressed(mb_left)) {
            talent1.action();
            //TODO: sound
            instance_destroy();
            exit;
        }
        _doDrawHint = true;
        _hint_text = talent1.hint;
    } else {
        draw_sprite_stretched(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h);
    }
    if (talent1.stackable) {
        draw_sprite_stretched_ext(spr_stackable, 0, _x+_type_offset_x, _y+_type_offset_y, _type_w, _type_h, c_purple, _type_alpha);
        draw_textbox_color(_x+_type_offset_x+1, _y+_type_offset_y+1, _type_w-2, _type_h-2, $"{talent1.current_stack}/{talent1.max_stacks}", c_white);
    }
    draw_sprite_stretched(talent1.sprite_index, talent1.image_index, _x+_image_offset_x, _y+_image_offset_y, _image_w, _image_h);
    draw_textbox_color(_x + 54, _y + 90, 26, 18, talent1.name, c_yellow, fa_center, fa_middle);
} else {
    draw_sprite_stretched_ext(spr_talent_nothing, 0, _x, _y, _picker_w, _picker_h, c_white, 0.6);
}

_x += _picker_w+_gap_w;
if (talent2 != noone) {
    var _spr = getCostSpr(talent2);
    draw_sprite_stretched(_spr, 0, _x+_cost_offset_x, _y+_cost_offset_y, _cost_w, _cost_h);
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_picker_w, _y+_picker_h) ) {
        draw_sprite_stretched_ext(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h, c_ltgray, 1);
        if (mouse_check_button_pressed(mb_left)) {
            talent2.action();
            //TODO: sound
            instance_destroy();
            exit;
        }
        _doDrawHint = true;
        _hint_text = talent2.hint;
    } else {
        draw_sprite_stretched(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h);
    }
    if (talent2.stackable) {
        draw_sprite_stretched_ext(spr_stackable, 0, _x+_type_offset_x, _y+_type_offset_y, _type_w, _type_h, c_purple, _type_alpha);
        draw_textbox_color(_x+_type_offset_x+1, _y+_type_offset_y+1, _type_w-2, _type_h-2, $"{talent2.current_stack}/{talent2.max_stacks}", c_white);
    }
    draw_sprite_stretched(talent2.sprite_index, talent2.image_index, _x+_image_offset_x, _y+_image_offset_y, _image_w, _image_h);
    draw_textbox_color(_x + 54, _y + 90, 26, 18, talent2.name, c_yellow, fa_center, fa_middle);
} else {
    draw_sprite_stretched_ext(spr_talent_nothing, 0, _x, _y, _picker_w, _picker_h, c_white, 0.6);
}

_x += _picker_w+_gap_w;
if (talent3 != noone) {
    var _spr = getCostSpr(talent3);
    //Cost:
    draw_sprite_stretched(_spr, 0, _x+_cost_offset_x, _y+_cost_offset_y, _cost_w, _cost_h);
    //Backdrop:
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_picker_w, _y+_picker_h) ) {
        draw_sprite_stretched_ext(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h, c_ltgray, 1);
        if (mouse_check_button_pressed(mb_left)) {
            talent3.action();
            //TODO: sound
            instance_destroy();
            exit;
        }
        _doDrawHint = true;
        _hint_text = talent3.hint;
    } else {
        draw_sprite_stretched(spr_talent_engraving, 0, _x, _y, _picker_w, _picker_h);
    }
    //Type marker:
    if (talent3.stackable) {
        draw_sprite_stretched_ext(spr_stackable, 0, _x+_type_offset_x, _y+_type_offset_y, _type_w, _type_h, c_purple, _type_alpha);
        draw_textbox_color(_x+_type_offset_x+1, _y+_type_offset_y+1, _type_w-2, _type_h-2, $"{talent3.current_stack}/{talent3.max_stacks}", c_white);
    }
    //Image:
    draw_sprite_stretched(talent3.sprite_index, talent3.image_index, _x+_image_offset_x, _y+_image_offset_y, _image_w, _image_h);
    //Name:
    draw_textbox_color(_x + 54, _y + 90, 26, 18, talent3.name, c_yellow, fa_center, fa_middle);
} else {
    draw_sprite_stretched_ext(spr_talent_nothing, 0, _x, _y, _picker_w, _picker_h, c_white, 0.6);
}

_x = _left + _gap_w;
_y += _picker_h + 4;
var _reroll_width = 16+8;
var _reroll_height = 16+8;
var _reroll_icon_gap = 2;
var _reroll_icon_w = _reroll_width-8-_reroll_icon_gap;
var _reroll_icon_h = _reroll_height-8-_reroll_icon_gap;
var _reroll_icon_margin_x = 4 + _reroll_icon_gap/2;
var _reroll_icon_margin_y = 4 + _reroll_icon_gap/2;

if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+(_reroll_width-1), _y+(_reroll_height-1))) {
    _doDrawHint = true;
    _hint_text = string(getText("Talent_picker_reroll_hint"), reroll_cost);
    
    if (can_reroll() && mouse_check_button(mb_left)) {
        draw_sprite_stretched(spr_button, 2, _x, _y, _reroll_width, _reroll_height);
        draw_sprite_stretched_ext(spr_recycle, 0, _x+_reroll_icon_margin_x, _y+_reroll_icon_margin_y, _reroll_icon_w, _reroll_icon_h, c_yellow, 0.8);
    } else {
        var _alpha = 1;
        if (!can_reroll()) {
            _alpha = 0.5;
            draw_set_alpha(_alpha);
        }
        draw_sprite_stretched(spr_button, 1, _x, _y, _reroll_width, _reroll_height);
        draw_sprite_stretched_ext(spr_recycle, 0, _x+_reroll_icon_margin_x, _y+_reroll_icon_margin_y, _reroll_icon_w, _reroll_icon_h, c_yellow, _alpha);
        draw_set_alpha(1);
    }
    
    if (can_reroll() && mouse_check_button_released(mb_left)) {
        reroll(false);
        return;
    }
} else {
    var _alpha = 1;
    if (!can_reroll()) {
        _alpha = 0.5;
        draw_set_alpha(_alpha);
    }
    draw_sprite_stretched(spr_button, 0, _x, _y, _reroll_width, _reroll_height);
    draw_sprite_stretched_ext(spr_recycle, 0, _x+_reroll_icon_margin_x, _y+_reroll_icon_margin_y, _reroll_icon_w, _reroll_icon_h, c_yellow, _alpha);
    draw_set_alpha(1);
}

_x = _right - _reroll_width - _gap_w;
if (!has_delay) {
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+(_reroll_width-1), _y+(_reroll_height-1))) {
        _doDrawHint = true;
        _hint_text = string(getText("Talent_picker_force_delay"), force_delay_cost);
        
        if (can_force_delay() && mouse_check_button(mb_left)) {
            draw_sprite_stretched(spr_button, 2, _x, _y, _reroll_width, _reroll_height);
            draw_sprite_stretched_ext(spr_talent_delay, 0, _x+_reroll_icon_margin_x, _y+_reroll_icon_margin_y, _reroll_icon_w, _reroll_icon_h, c_white, 0.8);
        } else {
            var _alpha = 1;
            if (!can_reroll()) {
                _alpha = 0.5;
                draw_set_alpha(_alpha);
            }
            draw_sprite_stretched(spr_button, 1, _x, _y, _reroll_width, _reroll_height);
            draw_sprite_stretched_ext(spr_talent_delay, 0, _x+_reroll_icon_margin_x, _y+_reroll_icon_margin_y, _reroll_icon_w, _reroll_icon_h, c_white, _alpha);
            draw_set_alpha(1);
        }
        
        if (can_force_delay() && mouse_check_button_released(mb_left)) {
            force_delay();
            return;
        }
    } else {
        var _alpha = 1;
        if (!can_force_delay()) {
            _alpha = 0.5;
            draw_set_alpha(_alpha);
        }
        draw_sprite_stretched(spr_button, 0, _x, _y, _reroll_width, _reroll_height);
        draw_sprite_stretched_ext(spr_talent_delay, 0, _x+_reroll_icon_margin_x, _y+_reroll_icon_margin_y, _reroll_icon_w, _reroll_icon_h, c_white, _alpha);
        draw_set_alpha(1);
    }
    }

if (_doDrawHint) {
    var _halign = fa_left;
    var _valign = fa_top;
    var _margin = 8;
    var _hint_x = mouse_gui_x+_margin;
    var _hint_y = mouse_gui_y+_margin
    if (mouse_gui_x > 160) {
        _halign = fa_right;
        _hint_x = mouse_gui_x-_margin;
    }
    if (mouse_gui_y > 100) {
        _valign = fa_bottom;
        _hint_y = mouse_gui_y-_margin;
    }
    draw_textbox_background(_hint_x, _hint_y, _picker_w, _picker_h, _hint_text, new BackgroundData(spr_hint_back, 0, _margin), _halign, _valign, undefined, 0.6);
}