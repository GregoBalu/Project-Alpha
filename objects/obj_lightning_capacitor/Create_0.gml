// Inherit the parent event
event_inherited();

stored_energy = 0;
max_energy = 100;
energised = false;

charging_speed = 0.5;
discharge_speed = 0.15;

min_frame = 0;
max_frame = 10;

triggered = false;

On = function(_id) {
    energised = true;
}

Off = function(_id) {
    energised = false;
}
