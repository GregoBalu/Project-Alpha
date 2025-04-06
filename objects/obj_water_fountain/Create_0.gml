
is_plugged = false;
plugged_by = noone;

image_index = 0;
image_speed = 0;

if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}

if (is_on && !paused) {
    image_index = 1;
    image_speed = 1;
}