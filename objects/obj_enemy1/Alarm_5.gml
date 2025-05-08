audio_falloff_set_model(audio_falloff_exponent_distance);
audio_play_sound_at(snd_firetoad_idle, x, y, 0, 32, 64, 2, false, 5);
alarm[5] = random_range(5, 10) * TIME_SECOND;