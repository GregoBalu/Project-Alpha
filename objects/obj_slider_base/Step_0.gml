

var _is_mouse_over_slider = point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height);
var _is_mouse_over_indicator = point_in_rectangle(mouse_x, mouse_y, indicator_pos.x+indicator_pos.x_offset, indicator_pos.y, 
        indicator_pos.x+indicator_pos.x_offset + indicator_pos.w-1, indicator_pos.y + indicator_pos.h-1);
var _is_mouse_clicked = mouse_check_button(mb_left);

if (!previous_mouse_click && !_is_mouse_over_slider && !_is_mouse_over_indicator )
    return;

if (!previous_mouse_click && _is_mouse_clicked) {
    //pressed
    previous_mouse_click = true;
    previous_click_indicator = _is_mouse_over_indicator;
    
    
} else if (previous_mouse_click && !_is_mouse_clicked) {
    //release
    previous_mouse_click = false;
    
    if (previous_click_indicator) {
        var new_current_value = (indicator_pos.x - x) / sprite_width;
        current_value = new_current_value;
        onValueChanged(current_value);
    } else {
        indicator_pos.x = clamp(mouse_x, x, x+sprite_width);
        var new_current_value = (indicator_pos.x - x) / sprite_width;
        current_value = new_current_value;
        onValueChanged(current_value);
    }
    
    
} else if (previous_mouse_click && _is_mouse_clicked) {
    //drag
    if (previous_click_indicator) {
        indicator_pos.x = clamp(mouse_x, x, x+sprite_width);
    }
    
}

