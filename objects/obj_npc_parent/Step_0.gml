if (instance_exists(obj_dialog)) exit;
    
if (instance_exists(obj_player) && distance_to_object(obj_player) < talk_distance) {
    if (!can_talk) {
        can_talk = true;
        obj_gui.show_talk++;
        audio_play_sound_at(snd_huh, x, y, 0, 1, 16, 0.3, false, 5);
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

if (do_wander) {

    var _hor = clamp(target_x - x, -1, 1);
    var _ver = clamp(target_y - y, -1, 1);
    
    move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, obj_enemy_base], undefined, undefined, undefined, move_speed, move_speed); {}
    if (_hor != 0 || _ver != 0) {
        //MOVING = true;
    } else {
        //MOVING = false;
    }
}