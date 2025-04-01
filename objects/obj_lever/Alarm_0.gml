if (is_on) {
    image_index = 1;
    if (instance_exists(activate_inst)) {
        activate_inst.On(id);
    }
} else {
    image_index = 0;
    if (instance_exists(activate_inst)) {
        activate_inst.Off(id);
    }
}