//draw_self();
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, sprite_angle, image_blend, image_alpha);

if (DEBUG) {
    draw_set_colour(c_red);
    draw_arrow(x, y, x+lengthdir_x(16, image_angle-90), y+lengthdir_y(16, image_angle-90), 2);
    draw_set_colour(c_black);
    draw_circle_colour(target_x, target_y, 2, c_blue, c_blue, false);

}