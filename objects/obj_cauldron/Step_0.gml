event_inherited();

if (state == InterractItemState.Undisturbed) {
    ++frame;
    
    if (sub_img == 1 && frame > anim_speed) {
        sub_img = 2;
        frame = 0;
    } else if (sub_img == 2 && frame > anim_speed) {
        sub_img = 1;
        frame = 0;
    }
}