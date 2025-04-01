
image_speed = 0;

if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}

if (is_on) {
    image_index = 1;
} else {
    image_index = 0;
}
alarm[0] = TIME_SECOND;

is_near = false;