// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Helmet;

bonus_lifesteal = 0.1;
minus_defense = 0.3;

name = getText("Item_helm_of_horns_name");
description = string(getText("Item_helm_of_horns_desc"), bonus_lifesteal*100, minus_defense);



function equip() {
    obj_player.lifesteal += bonus_lifesteal;
    obj_player.defense -= minus_defense;
}
function unequip() {
    obj_player.lifesteal -= bonus_lifesteal;
    obj_player.defense += minus_defense;
}