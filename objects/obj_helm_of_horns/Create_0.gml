// Inherit the parent event
event_inherited();


name = "Helm of Horns";
description = "This horny blade is ready for some action if you want to.";

is_equipable = true;


equip_slot = EquipSlot.Helmet;

bonus_lifesteal = 0.1;
minus_defense = 0.5;

function equip() {
    obj_player.lifesteal += bonus_lifesteal;
    obj_player.defense -= minus_defense;
}
function unequip() {
    obj_player.lifesteal -= bonus_lifesteal;
    obj_player.defense += minus_defense;
}