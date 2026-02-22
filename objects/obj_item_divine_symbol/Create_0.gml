// Inherit the parent event
event_inherited();

_pickupText = $"+{getText("Divine_symbol_pickup")}"
_pickupColor = c_aqua;

onPickup = function(othr) {
    
    if (room == Room1) {
        global.divine_room1 = true;
    }
    
    
    othr.divine_symbols++;
    return true;
}
