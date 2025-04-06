if (!is_on) {
    exit;
}

if (is_plugged) {
    exit;
}

if (other.carried_by == noone) {
    is_plugged = true;
    plugged_by = other;
    image_index = 0;
    image_speed = 0;
    
    if (instance_exists(activate_inst)) {
        activate_inst.On(id);
    }
}