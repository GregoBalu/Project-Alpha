draw_set_font(font_base);

draw_self();

if (is_stunned) {
    draw_sprite_stretched(spr_battle_ko, 0, x-sprite_width, y-sprite_height, sprite_width, sprite_height);
}

var _x = xstart -20;
var _y = 110;
var _w = 40;
var _h = 8;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (data.hp / data.hp_total), _h, hp_color, 1);
if (point_in_rectangle(mouse_x, mouse_y, _x, _y, _x + _w, _y+_h)) {
    draw_textbox_background(mouse_x+5, mouse_y-5, 10, 6, data.hp, new BackgroundData(spr_hint_back, 0, 2), fa_left, fa_bottom);
}

_y += _h + 2;
_h = 6;
_w -=9;

var chargeAttackFactor = data.charge_attack div 1.0;
var remAttackCharge = data.charge_attack mod 1.0;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * remAttackCharge, _h, Color_AttackCharge, 1);

_x += _w;

draw_sprite_stretched(spr_box, 0, _x, _y-1, 9, 8);
draw_text_transformed_color(_x+1, _y-1, string_concat("x", chargeAttackFactor), 0.35, 0.35, 0, Color_AttackCharge, Color_AttackCharge, Color_AttackCharge, Color_AttackCharge, 1);

_x -= _w;
_y += _h + 2;

var chargeUtilFactor = data.charge_util div 1.0;
var remUtilCharge = data.charge_util mod 1.0;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * remUtilCharge, _h, Color_UtilityCharge, 1);

_x += _w;

draw_sprite_stretched(spr_box, 0, _x, _y-1, 9, 8);
draw_text_transformed_color(_x+1, _y-1, string_concat("x", chargeUtilFactor), 0.35, 0.35, 0, Color_UtilityCharge, Color_UtilityCharge, Color_UtilityCharge, Color_UtilityCharge, 1);