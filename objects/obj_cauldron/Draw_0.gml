draw_self();

if (state == InterractItemState.Undisturbed) {
    draw_sprite_stretched_ext(sprite_index, sub_img, topLeft.x, topLeft.y, sprite_width, sprite_height, ingredient.brew_color, 0.95);
}
