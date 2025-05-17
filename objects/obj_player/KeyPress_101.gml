//add_corruption(-1);
//screenshake(20, 120, 2, 0.25);
//show_debug_message($"Corruption: {corruption}/{corruption_total}");
var rr = random_range(80, 130) / 100;
show_debug_message($"Sound with pitch: {rr}");
audio_play_sound(snd_firetoad_lick, 5, false, 1.0, 0, rr);