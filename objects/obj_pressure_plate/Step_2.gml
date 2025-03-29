
if (!previousPressed && isPressed) {
    if (instance_exists(activate_inst)) {
        activate_inst.On(id);
    }
    image_index = 1;
} else if (previousPressed && !isPressed) {
    if (do_reset) {
        if (instance_exists(activate_inst)) {
            activate_inst.Off(id);
        }
        image_index = 0;
    }
}