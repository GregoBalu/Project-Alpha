checked = !checked;
if (checked) {
    image_index = 1;
} else {
    image_index = 0;
}

if (checked) audio_play_sound(snd_click, AUDIO_PRIO_EFFECTS, false, 0.8);
else audio_play_sound(snd_clack, AUDIO_PRIO_EFFECTS, false, 0.9);

onChanged();
