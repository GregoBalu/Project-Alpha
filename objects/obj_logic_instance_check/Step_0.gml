var state = instance_exists(inst_id);
if (state == prev_state) exit;

if (state) {
    if (trigger_on_exist) {
        activate_inst.On(id);
    } else {
        activate_inst.Off(id);
    }
} else {
    if (trigger_on_exist) {
        activate_inst.Off(id);
    } else {
        activate_inst.On(id);
    }
}
prev_state = state;