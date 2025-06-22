// Inherit the parent event
event_inherited();

if (distance_to_object(obj_player) < 16) {
    if (isSleeping) {
        isSleeping = false;
        image_index = 1;
        alarm[1] = animation_delay_seconds*TIME_SECOND;
    }
} else {
    if (!isSleeping) {
        isSleeping = true;
        image_index = 0;
    }
}