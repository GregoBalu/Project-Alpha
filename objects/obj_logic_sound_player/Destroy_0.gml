if (audio != noone && audio_is_playing(audio)) {
    audio_stop_sound(audio);
    audio = noone;
}