// Inherit the parent event
event_inherited();

if (!variable_global_exists("show_hints")) {
    global.show_hints = true;
}

checked = global.show_hints;
refresh_image();

onChanged = function() {
    // override me
    global.show_hints = checked;
    if (checked) audio_play_sound(snd_click, AUDIO_PRIO_EFFECTS, false, 0.8);
    else audio_play_sound(snd_clack, AUDIO_PRIO_EFFECTS, false, 0.9);
}
