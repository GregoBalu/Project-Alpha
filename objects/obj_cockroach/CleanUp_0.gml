// Inherit the parent event
event_inherited();

if (audio_is_playing(audio)) {
    audio_stop_sound(audio);
}
    