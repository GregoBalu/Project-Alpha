// Inherit the parent event
event_inherited();

var _dist = distance_to_object(obj_player);

if (!immobilized && follow_target == noone && _dist < follow_max_distance) {
    if (DEBUG) show_debug_message("NPC Cockroach acquired target!");
    set_follow_target(obj_player);
}

if (!immobilized && _dist < 48 && !audio_is_playing(audio)) {
    audio_falloff_set_model(audio_falloff_exponent_distance);
    audio = audio_play_sound_at(snd_cockroach_scurry, x, y, 0, 32, 48, 1, false, AUDIO_PRIO_EFFECTS, 0.7, 0, random_range(0.9, 1.1));
}
