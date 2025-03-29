//target_width = 24;
//target_height = 24;


image_xscale = target_width/sprite_width;
image_yscale = target_height/sprite_height;

alarm[0] = life_seconds * TIME_SECOND;
if (splash_image != noone && splash_seconds > 0) {
    alarm[1] = (life_seconds - splash_seconds) * TIME_SECOND;
}

//show_debug_message("Projectile spawned @ {0},{1} -> {2}", x, y, move_direction);