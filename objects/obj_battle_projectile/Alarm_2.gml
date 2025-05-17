//after initial delay
visible = true;
alarm[0] = life_seconds * TIME_SECOND;
if (splash_image != noone && splash_seconds > 0) {
    alarm[1] = (life_seconds - splash_seconds) * TIME_SECOND;
}