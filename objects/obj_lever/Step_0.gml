if (distance_to_object(obj_player) < 8) {
    if (!is_near) {
        obj_gui.show_use++;
        is_near = true;
    }
    
    if (keyboard_check_pressed(global.input_use)) {
        is_on = !is_on;
        
        if (is_on) {
            image_index = 1;
            
            audio_falloff_set_model(audio_falloff_linear_distance);
            audio_play_sound_at(snd_click, x, y, 0, 0, 32, 2, false, AUDIO_PRIO_EFFECTS, 1, 0, random_range(0.9,1.1));
            if (instance_exists(activate_inst)) {
                activate_inst.On(id);
            }
        } else {
            image_index = 0;
            audio_falloff_set_model(audio_falloff_linear_distance);
            audio_play_sound_at(snd_clack, x, y, 0, 0, 32, 2, false, AUDIO_PRIO_EFFECTS, 1, 0, random_range(0.9,1.1));
            if (instance_exists(activate_inst)) {
                activate_inst.Off(id);
            }
        }
    }
} else {
    if (is_near) {
        obj_gui.show_use--;
        is_near = false;
    }
}