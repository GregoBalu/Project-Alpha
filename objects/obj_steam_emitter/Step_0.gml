// Inherit the parent event
event_inherited();

if (point_distance(x, y, obj_player.x, obj_player.y) > 128) {
    if (sound != undefined && !audio_is_paused(sound)) {
        audio_pause_sound(sound);
    }
} else {
    if (sound != undefined && audio_is_paused(sound)) {
        audio_resume_sound(sound);
    }
}