// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Helmet;

bonus_lifesteal = 0.1;
minus_defense = 0.3;

name = "Helm of Horns";
description = $"This horny cap is ready for some action if you want to.\nLifesteal: +{bonus_lifesteal*100}%\nDefense: -{minus_defense}";



function equip() {
    obj_player.lifesteal += bonus_lifesteal;
    obj_player.defense -= minus_defense;
}
function unequip() {
    obj_player.lifesteal -= bonus_lifesteal;
    obj_player.defense += minus_defense;
}