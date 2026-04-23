// Inherit the parent event
event_inherited();
init_localisation();

_pickupText = $"+{getText("Health_potion_pickup")} ({healing_amount})"
_pickupColor = c_green;

onPickup = function(othr) {
    if (othr.hp >= othr.hp_total) return false;
    
    var _hp_begin = othr.hp;
    othr.hp = clamp(othr.hp + healing_amount, 0, othr.hp_total);
    var _actual_healing = othr.hp - _hp_begin;
    if (othr.object_index == obj_player) {
        othr.statistic.healing_potion += _actual_healing;
        othr.statistic.healing_potion_count++;
    }
    return true;
}
