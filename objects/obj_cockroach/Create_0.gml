// Inherit the parent event
event_inherited();

sprite_angle = image_angle;
image_xscale = 0.8;
image_yscale = 0.8;

do_depth_shift = false;

depth = obj_player.depth+1;

audio_falloff_set_model(audio_falloff_exponent_distance);
audio = audio_play_sound_at(snd_cockroach_scurry, x, y, 0, 32, 48, 1, false, AUDIO_PRIO_EFFECTS, 1, 0, random_range(0.9, 1.1));
