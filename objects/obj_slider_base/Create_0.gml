min_value = 0;
max_value = 1;


indicator_width = sprite_get_width(spr_indicator);
indicator_height = sprite_get_height(spr_indicator);

indicator_pos = {
    x: x + sprite_width*(current_value/max_value),
    x_offset: -indicator_width/2,
    y: y - (1.1*4*image_yscale),
    w: 0.8*indicator_width,
    h : 1.1*image_yscale * indicator_height
}

previous_mouse_click = false;
previous_click_indicator = false;


function onValueChanged(new_value) {
    //Override me
}