visible = false;


if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}


On = function(_inst_id) {
    
    if (instance_exists(activate_inst)) {
        activate_inst.Off(id);
    }
};

Off = function(_inst_id) {
    
    if (instance_exists(activate_inst)) {
        activate_inst.On(id);
    }
};
