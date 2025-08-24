enum FuelSpillageAlarms { LifeTime = 0, SizeIncresae = 1 };

show_debug_message($"Fuel spillage spawned");

life_over = false;
image_angle = random_range(0, 359);
scaling = random_range(0.9, 1.2);

image_xscale = scaling*0.5;
image_yscale = scaling*0.5;

audio_play_sound(snd_pop, 4, false);

alarm[FuelSpillageAlarms.LifeTime] = timeSeconds*TIME_SECOND;
alarm[FuelSpillageAlarms.SizeIncresae] = 10;
