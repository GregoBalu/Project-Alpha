audio_play_sound(data.battle.idle_sound, 5, false, 1.0, 0, random_range(0.9, 1.1));

alarm[5] = random_range(data.battle.idle_sound_min_seconds, data.battle.idle_sound_max_seconds) * TIME_SECOND;