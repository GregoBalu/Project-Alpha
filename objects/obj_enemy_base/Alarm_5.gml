/// @description Idle random sound 

if (idle_sound == noone) exit;

if (distance_to_object(obj_player) <= 64 ) {
    audio_falloff_set_model(audio_falloff_exponent_distance);
    audio_play_sound_at(idle_sound, x, y, 0, 32, 64, 1, false, AUDIO_PRIO_NOISE);
}
alarm[5] = random_range(5, 10) * TIME_SECOND;