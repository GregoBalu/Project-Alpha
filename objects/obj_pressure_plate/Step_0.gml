if (!is_on) {
    exit;
}


var _id = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_item_carriable, false, true);
if (_id != noone && _id.carried_by != noone) {
    _id = noone;
}
if (_id == noone) {
    _id = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true);
}
if (_id != noone) {
    //in collision
    
    if (state == PressurePlateState.NotPressed) {
        show_debug_message($"Pressure plate @{x},{y} On()");
        if (instance_exists(activate_inst)) {
            activate_inst.On(id);
        }
        image_index = 1;
        state = PressurePlateState.Pressed;
        audio_falloff_set_model(audio_falloff_linear_distance);
        audio_play_sound_at(snd_click, x, y, 0, 0, 32, 2, false, AUDIO_PRIO_NOISE, 1, 0, random_range(0.9,1.1));
    }
    
} else {
    //not in collision
    if (do_reset && state == PressurePlateState.Pressed) {
        show_debug_message($"Pressure plate @{x},{y} Off()");
        if (instance_exists(activate_inst)) {
            activate_inst.Off(id);
        }
        image_index = 0;
        state = PressurePlateState.NotPressed;
        audio_falloff_set_model(audio_falloff_linear_distance);
        audio_play_sound_at(snd_clack, x, y, 0, 0, 32, 2, false, AUDIO_PRIO_NOISE, 1, 0, random_range(0.9,1.1));
    }
}
