draw_self();

if (is_on && !paused) {
    draw_sprite_ext(spr_water_arrow, arrow_subimg, x, y, is_boosted?1.5:1.1, is_boosted?1.5:1.1, (force_direction + 180) mod 360, c_white, 1);
}