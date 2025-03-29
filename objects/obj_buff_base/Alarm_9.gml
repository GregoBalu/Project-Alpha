//blink off
if (blink_duration <= 0) {
    //duration ends
    instance_destroy();
}

image_alpha = .2;

if (blink_duration < blink_interval) {
    alarm[10] = max(1,blink_duration*TIME_SECOND);
    blink_duration = 0;
} else {
    blink_duration -= blink_interval;
    alarm[10] = blink_interval*TIME_SECOND;
}