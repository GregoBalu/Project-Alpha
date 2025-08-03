draw_shadow();
draw_self();

if (show_eye) {
    draw_sprite_stretched(spr_eyes, eye_subimg, x-8, y-5, 14, 14);
}

if (can_talk && !instance_exists(obj_dialog)) {
    draw_sprite(spr_talk, talk_index, x, y -16);
    
}