// Inherit the parent event
event_inherited();

image_xscale = .5;
image_yscale = .5;

_pickupText = $"+{coin_amount} coins"
_pickupColor = c_yellow;

onPickup = function(othr) {
    othr.coins += coin_amount;
    return true;
}
