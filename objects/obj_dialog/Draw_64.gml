display_set_gui_size(gui_w, gui_h);

var _dx = 0;
var _dy = gui_h - dialog_height;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

var _msg = messages[current_message];

if (_msg.name == global.dialog_player_name && _msg.spr != undefined && _msg.spr != noone) {
    var _w = sprite_get_width(_msg.spr);
    var _h = sprite_get_height(_msg.spr);
    
    var _spr_w = speaker_sprite_width;
    var _spr_h = _spr_w * (_h / _w);
    
    draw_sprite_stretched_ext(_msg.spr, 0, 0-sprite_animate_x, gui_h*0.3, _spr_w, _spr_h, _msg.spr_tint, 1);
} else if (_msg.spr != undefined) {
    var _w = sprite_get_width(_msg.spr);
    var _h = sprite_get_height(_msg.spr);
    
    var _spr_w = speaker_sprite_width;
    var _spr_h = _spr_w * (_h / _w);
    
    draw_sprite_stretched_ext(_msg.spr, 0, gui_w-speaker_sprite_width+sprite_animate_x, gui_h*0.3, _spr_w, _spr_h, _msg.spr_tint, 1);
}

draw_sprite_stretched(spr_box, 0, _dx, _dy, _boxw, _boxh);

_dx += 16;
_dy += 16;

draw_set_font(font_base);
var _name = _msg.name;
draw_set_color(_msg.color);
draw_text(_dx, _dy, _name);
draw_set_color(c_black);

//draw_text(_dx + 100, _dy, $"{current_char}/ {string_length(_msg.msg)}");

_dx += 4;
_dy += 40;

var _text_width = _boxw - _dx*2;

draw_set_color(_msg.msg.color);
draw_set_font(_msg.msg.font);
draw_text_ext(_dx, _dy, draw_message, -1, _text_width);

draw_set_font(font_base);
draw_set_color(c_ltgray);

if (_msg.type == DialogType.Chat) {
    
} else {
    if (at_end) {
        var _choice_start_y = _dy;
        var _last_drawn = choice_scroll;
        var _choices_count = array_length(_msg.choices);
        _dy += string_height_ext(draw_message, -1, _text_width) + 4;
        
        var _lastHeight = 0;
        for (var _c = choice_scroll; _c < array_length(_msg.choices); _c++)  {
            if (!_msg.choices[_c].condition()) { 
                _choices_count--;
                continue;
            }
            _dy += _lastHeight + 4;
            if (_dy >= gui_h-4) {
                choice_need_scroll = true;
                continue;
            }
            _last_drawn = _c;
            draw_set_color(_msg.choices[_c].color);
            draw_set_font(_msg.choices[_c].font);
            draw_text_ext(_dx, _dy, _msg.choices[_c].text, -1, _text_width);
            var _width = string_width_ext(_msg.choices[_c].text, -1, _text_width);
            _lastHeight = string_height_ext(_msg.choices[_c].text, -1, _text_width);
            draw_rectangle(_dx, _dy, _dx+_width, _dy+_lastHeight, true);
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _dx, _dy, _dx+_width, _dy+_lastHeight)) {
                draw_set_alpha(0.4);
                draw_rectangle_color(_dx, _dy, _dx+_width, _dy+_lastHeight-1, c_gray, c_gray, c_gray, c_gray, false);
                draw_set_alpha(1);
                if (mouse_check_button_pressed(mb_left)) {
                    _msg.choices[_c].onClick();
                    choice_need_scroll = false;
                    choice_scroll = 0;
                }
            }
            
            draw_set_font(font_base);
            draw_set_color(c_ltgray);
        }
        if (choice_need_scroll) {
            var _scroll_x1 = _boxw-25;
            var _scroll_x2 = _boxw-21;
            draw_set_alpha(0.8);
            var _scroll_height = (gui_h-1)-_choice_start_y;
            draw_rectangle_color(_scroll_x1, _choice_start_y, _scroll_x2, gui_h-1, c_gray, c_gray, c_gray, c_gray, false);
            draw_set_alpha(1);
            var _percent_drawn = (_last_drawn - choice_scroll+1) / _choices_count;
            var _scrollable_height = _scroll_height * _percent_drawn;
            var _scroll_at_percent = choice_scroll / _choices_count;
            var _scrollable_y = _choice_start_y + (_scroll_at_percent*_scroll_height);
            //show_debug_message($"scroll_h={_scroll_height} scrollable={_scrollable_height}   perc={_percent_drawn}% @{_scroll_at_percent} / {_choices_count} y={_scrollable_y}");
            draw_rectangle_color(_scroll_x1, _scrollable_y, _scroll_x2, _scrollable_y+_scrollable_height, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
            //draw_line_color(_scroll_x1, _scrollable_y+(_scrollable_height/3), _scroll_x2, _scrollable_y+(_scrollable_height/3), c_black, c_black);
            //draw_line_color(_scroll_x1, _scrollable_y+2*(_scrollable_height/3), _scroll_x2, _scrollable_y+2*(_scrollable_height/3), c_black, c_black);
        }
    }
}

var _but_w = 36;
draw_button_hint(_boxw - 26 - _but_w, gui_h - 30, _but_w, 2*_but_w/3, 4, global.input_talk);

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