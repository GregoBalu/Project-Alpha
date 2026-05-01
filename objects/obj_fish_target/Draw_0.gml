draw_self();

var prog_prec = progress/max_progress;

draw_sprite_stretched(spr_box, 0, x-8, y+20, 16, 4);
draw_sprite_stretched_ext(spr_box, 1, x-8, y+20, 16*prog_prec, 4, c_red, 1);

draw_rope(bbox_left, y, mouse_x, mouse_y);
draw_rope(bbox_right, y, mouse_x, mouse_y);
draw_rope(x, bbox_top, mouse_x, mouse_y);
draw_rope(x, bbox_bottom, mouse_x, mouse_y);
