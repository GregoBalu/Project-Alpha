var _id = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_fuel_container, false, false);

if (_id != noone && _id.fill_level < _id.max_fill_level) {
    if (!is_filling) {
        is_filling = true;
        image_index = 1;
        image_speed = original_image_speed;
        if (DEBUG) show_debug_message($"Fuel filling");
            
        audio = audio_play_sound(snd_fill, AUDIO_PRIO_EFFECTS, false, 1, 0, 1);
    }
} else {
    if (is_filling) {
        is_filling = false;
        image_index = 0;
        image_speed = 0;
        if (audio_is_playing(audio)) {
            audio_stop_sound(audio);
        }
    }
}

if (is_filling) {
    image_index += 0.1;
    if (image_index >= 3.5) {
        image_index = 0.5;
    }
    
    if (_id.fill_level < _id.max_fill_level) {
        _id.fill_level = clamp(_id.fill_level+10, 0, _id.max_fill_level);
    }
}