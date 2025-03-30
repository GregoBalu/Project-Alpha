draw_shadow();
draw_self();

/*draw_circle_color(xstart, ystart, 2, c_lime, c_lime, false);
draw_circle_color(target_x, target_y, 2, c_red, c_red, false);
draw_circle_color(xstart, ystart, wander_range, c_blue, c_blue, true);
draw_circle_color(xstart, ystart, wander_range*2, c_yellow, c_yellow, true);*/

if (can_talk && !instance_exists(obj_dialog)) {
    draw_sprite(spr_talk, 0, x, y -16);
    
}