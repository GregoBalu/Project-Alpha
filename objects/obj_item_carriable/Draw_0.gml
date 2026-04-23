if (carried_by == noone) {
    draw_glow(_background_sprite_time, _background_sprite_refresh_rate);
    
    if (lastShowState) {
        //show_debug_message("alma")
        //draw_sprite_stretched_ext(sprite_index, image_index, x-5, y-5, (bbox_left-bbox_right)+10, (bbox_bottom-bbox_top)+10, c_yellow, 1);
        //draw_circle_colour(x, y, 2*sprite_width/6, c_yellow, c_yellow, false);
    }
}



draw_self();