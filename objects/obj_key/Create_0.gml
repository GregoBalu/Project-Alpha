// Inherit the parent event
event_inherited();


_pickupText = $"+1 {keyColor2Str(key_color)} key";
_pickupColor = c_white;

image_blend = keyColor2Color(key_color);

onPickup = function(othr) {
    obj_player.key_ring.add(key_color);
    return true;
}
