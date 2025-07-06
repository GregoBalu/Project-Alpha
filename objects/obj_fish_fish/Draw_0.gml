draw_self();

var _progress = (timer/max_timer);

draw_sprite_stretched(spr_box, 0, x+8, y-8, 4, 16);
draw_sprite_stretched_ext(spr_box, 1, x+8, y-8 + (1-_progress)*16, 4, _progress*16, c_yellow, 1);

