// Inherit the parent event
event_inherited();

image_xscale = .5;
image_yscale = .5;

onPickup = function(othr) {
    othr.coins += coin_amount;
    return true;
}
