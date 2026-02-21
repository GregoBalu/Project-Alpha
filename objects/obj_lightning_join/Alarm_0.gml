///@description Zapping check

check_zapping(0);

if (zapped_by != noone) {
    if (!audio_is_playing(zapping_audio)) {
        audio_falloff_set_model(audio_falloff_linear_distance);
        zapping_audio = audio_play_sound_at(snd_buzz2, x, y, 0, 16, 64, 2, true, AUDIO_PRIO_NOISE);
    }
} else {
    if (audio_is_playing(zapping_audio)) {
        audio_stop_sound(zapping_audio);
        
    }
}
