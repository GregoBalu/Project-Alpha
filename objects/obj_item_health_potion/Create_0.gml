// Inherit the parent event
event_inherited();

_pickupText = $"+health potion ({healing_amount})"
_pickupColor = c_green;

onPickup = function(othr) {
    othr.hp = clamp(othr.hp + healing_amount, 0, othr.hp_total);
    return true;
}
