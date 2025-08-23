enum FuelSpillageAlarms { LifeTime = 0 };

show_debug_message($"Fuel spillage spawned");

life_over = false;
image_angle = random_range(0, 359);
scaling = random_range(0.9, 1.2);

image_xscale = scaling;
image_yscale = scaling;

alarm[FuelSpillageAlarms.LifeTime] = timeSeconds*TIME_SECOND;