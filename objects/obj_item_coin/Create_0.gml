// Inherit the parent event
event_inherited();
init_localisation();

resize_to(Loot_Size);

_pickupText = $"+{coin_amount} {getText("Coins_pickup")}"
_pickupColor = c_yellow;

onPickup = function(othr) {
    othr.coins += coin_amount;
    return true;
}
