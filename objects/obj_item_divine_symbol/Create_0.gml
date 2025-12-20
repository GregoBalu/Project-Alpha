// Inherit the parent event
event_inherited();

_pickupText = $"+divine symbol"
_pickupColor = c_aqua;

onPickup = function(othr) {
    
    if (room == Room1) {
        global.divine_room1 = true;
    }
    
    
    othr.divine_symbols++;
    return true;
}
