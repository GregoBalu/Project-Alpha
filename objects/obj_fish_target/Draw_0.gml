draw_self();

var prog_prec = progress/max_progress;

draw_sprite_stretched(spr_box, 0, x-8, y+20, 16, 4);
draw_sprite_stretched_ext(spr_box, 1, x-8, y+20, 16*prog_prec, 4, c_red, 1);
