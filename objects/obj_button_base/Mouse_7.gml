if (instance_exists(obj_dialog) || instance_exists(obj_vendor) || global.do_pause) exit;

if (point_in_rectangle(mouse_x, mouse_y, x, y, bbox_right, bbox_bottom)) {
    state = ButtonState.Hover;
} else {
    state = ButtonState.Normal;
}

audio_play_sound(snd_clack, AUDIO_PRIO_EFFECTS, false, 0.5, undefined, 1.8);
clicked();