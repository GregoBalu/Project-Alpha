// Inherit the parent event
event_inherited();

onPickup = function(othr) {
    othr.hp = clamp(othr.hp + healing_amount, 0, othr.hp_total);
    return true;
}
