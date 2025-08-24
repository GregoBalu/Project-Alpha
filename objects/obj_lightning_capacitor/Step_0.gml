if (energised && stored_energy < max_energy) {
    stored_energy += charging_speed;
    if (stored_energy > max_energy) {
        stored_energy = max_energy;
    }
    
} else if (!energised && stored_energy > 0) {
    stored_energy -= discharge_speed;
    if (stored_energy < 0) {
        stored_energy = 0;
    }
    
}

if (logic_trigger != noone) {
    if (!triggered && stored_energy > 0) {
        logic_trigger.On(id);
        triggered = true;
    } else if (triggered && stored_energy == 0) {
        logic_trigger.Off(id);
        triggered = false;
    }
}

var _energy_meter = stored_energy / max_energy;
image_index = _energy_meter * max_frame;