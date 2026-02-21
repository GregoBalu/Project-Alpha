if (instance_exists(obj_dialog) || instance_exists(obj_vendor)) exit;
    
    
if (dialog != -1 && instance_exists(obj_player) && distance_to_object(obj_player) < talk_distance) {
    if (!can_talk) {
        can_talk = true;
        talk_index = 0;
        obj_gui.show_talk++;
        if (!is_silent) {
            audio_play_sound_at(snd_huh, x, y, 0, 1, 16, 0.3, false, AUDIO_PRIO_NOISE);
        }
    }
    
    if (keyboard_check_pressed(input_key)) {
        if (used_dialog && dialog_alt != -1) {
            create_dialog(dialog_alt);
        } else {
            create_dialog(dialog);
        }
        used_dialog = true;
    }
} else {
    if (can_talk) {
        can_talk = false;
        obj_gui.show_talk--;
    }
}

if (can_talk) {
    talk_index += 0.125;
    talk_index = talk_index mod 5;
}

if (do_wander) {

    npc_move_towards_point(target_x, target_y);

}