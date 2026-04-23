if (zapping) {
    if (!audio_is_playing(buzz_audio) && random_range(0,10) < 0.5) {
        audio_falloff_set_model(audio_falloff_linear_distance);
        buzz_audio = audio_play_sound_at(snd_buzz1, x, y, 0, 64, 128, 1, false, AUDIO_PRIO_NOISE, 0.8);
    }
}