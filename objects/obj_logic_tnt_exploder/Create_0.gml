visible = false;


if (!instance_exists(inst_id)) {
    show_debug_message("Empty inst_id for instance object {0}, object: {1}", id, object_index);
}
if (inst_id.object_index != obj_tnt) {
    show_debug_message("Not obj_tnt inst_id for instance object {0}, object: {1}", id, object_index);
}

used = false;

On = function(_inst_id) {
    if (used) exit;
    if (explode_on) {
        inst_id.explode();
        used = true;
    }
};
Off = function(_inst_id) {
    if (used) exit;
    if (!explode_on) {
        inst_id.explode();
        used = true;
    }
};
