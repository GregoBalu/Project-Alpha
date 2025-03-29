

draw_shadow();


draw_self();

//debug center:
//draw_circle_color(x, y, 0.5, c_red, c_red, false);

var _x = x - 10;
var _y = y - 18;
var _w = 20;
var _h = 6;
var hpPercent = (hp / hp_total);
var color = c_green;
if (.20 < hpPercent && hpPercent <= .50) {
    color = c_yellow;
} else if (hpPercent <= .20) {
    color = c_red;
}

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * hpPercent, _h, color, 1);

/*var xpPercent = (xp/xp_total);

_x += 1;
_y -= (_h-0.5);
_w -= 2;
_h -= 1;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * xpPercent, _h, c_teal, 1);*/