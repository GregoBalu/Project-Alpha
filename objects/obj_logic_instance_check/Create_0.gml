visible = false;


if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}


prev_state = instance_exists(inst_id);
