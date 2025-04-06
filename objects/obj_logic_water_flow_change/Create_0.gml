visible = false;


if (!instance_exists(inst_id)) {
    show_debug_message("Empty inst_id for instance object {0}, object: {1}", id, object_index);
}
if (inst_id.object_index != obj_flowing_water) {
    show_debug_message("Not obj_flowing_water inst_id for instance object {0}, object: {1}", id, object_index);
}

original_force = inst_id.force;
original_dir = inst_id.force_direction;


On = function(_inst_id) {
    inst_id.force = new_force;
    inst_id.force_direction = new_force_dir;
};
Off = function(_inst_id) {
    inst_id.force = original_force;
    inst_id.force_direction = original_dir;
};
