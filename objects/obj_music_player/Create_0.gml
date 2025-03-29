audio = undefined;
visible = false;

if (!audio_group_is_loaded(ag_music)) {
    audio_group_load(ag_music);
}
room_started = false;
