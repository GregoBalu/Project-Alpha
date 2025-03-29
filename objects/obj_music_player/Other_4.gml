room_started = true;
if (music != noone) {
    if (!audio_group_is_loaded(ag_music)) return;
    
    if (audio == undefined) {
        audio = audio_play_sound(music, 5, true, clamp(volume*global.audio_master_volume*global.audio_music_volume, 0, 1), offset, pitch);
        if (offset != undefined) {
            audio_sound_loop_start(audio, offset);
        }
    } else {
        audio_sound_gain(audio, 0, 0);
        audio_resume_sound(audio);
        audio_sound_gain(audio, clamp(volume, 0, 1), 1500);
    }
}