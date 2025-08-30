// Inherit the parent event
event_inherited();

audio = noone;

On = function(_inst_id) { 
    if (play_on && sound_id != noone) {
        if (audio != noone && audio_is_playing(audio)) {
            audio_stop_sound(audio);
            audio = noone;
        }
        show_debug_message($"On: Playing sound {sound_id}");
        audio_falloff_set_model(audio_falloff_linear_distance);
        audio = audio_play_sound_at(sound_id, x, y, 0, fallof_ref, fallof_max, fallof_factor, false, priority, gain, 0, pitch_shift?random_range(0.9,1.2):1);
    }
}
Off = function(_inst_id) {
    if (play_off && sound_id != noone) {
        if (audio != noone && audio_is_playing(audio)) {
            audio_stop_sound(audio);
            audio = noone;
        }
        show_debug_message($"Off: Playing sound {sound_id}");
        audio_falloff_set_model(audio_falloff_linear_distance);
        audio = audio_play_sound_at(sound_id, x, y, 0, fallof_ref, fallof_max, fallof_factor, false, priority, gain, 0, pitch_shift?random_range(0.9,1.2):1);
    }
}
