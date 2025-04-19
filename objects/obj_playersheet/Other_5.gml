if (openingSoundId != undefined && audio_is_playing(openingSoundId)) {
    audio_stop_sound(openingSoundId);
    openingSoundId = undefined;
}