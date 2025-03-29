visible = false;


if (!instance_exists(inst_id)) {
    show_debug_message("Empty inst_id for instance object {0}, object: {1}", id, object_index);
}
if (inst_id.object_index != obj_spike) {
    show_debug_message("Not obj_spike inst_id for instance object {0}, object: {1}", id, object_index);
}


On = function(_inst_id) {
    inst_id.pause();
};
Off = function(_inst_id) {
    inst_id.pause();
};
