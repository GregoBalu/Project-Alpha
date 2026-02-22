// Inherit the parent event
event_inherited();
init_localisation();


_pickupText = $"+1 {keyColor2Str(key_color)} {getText("Key_pickup")}";
_pickupColor = c_white;

image_blend = keyColor2Color(key_color);

onPickup = function(othr) {
    obj_player.key_ring.add(key_color);
    return true;
}
