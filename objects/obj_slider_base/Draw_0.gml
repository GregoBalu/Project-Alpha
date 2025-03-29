draw_self();

draw_sprite_stretched_ext(sprite_index, 0, x, y, indicator_pos.x - x, sprite_height, color, 1);

/*draw_rectangle(indicator_pos.x + indicator_pos.x_offset, indicator_pos.y, 
        indicator_pos.x + indicator_pos.x_offset+indicator_pos.w-1, indicator_pos.y+indicator_pos.h-1, true);*/
draw_sprite_stretched(spr_indicator, 0, indicator_pos.x + indicator_pos.x_offset, indicator_pos.y, indicator_pos.w, indicator_pos.h);

var val_percent = string_format(current_value*100, 3, 0);
draw_textbox(x+sprite_width+16, y, 32, sprite_height, $"{val_percent}%");