// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Armor;

increase_defense = 3;
minus_lifesteal = 2;

name = getText("Item_plate_armor_name");
description = string(getText("Item_plate_armor_desc"), increase_defense, minus_lifesteal*100);



function equip() {
    obj_player.defense += increase_defense;
    obj_player.lifesteal -= minus_lifesteal;
    
}
function unequip() {
    obj_player.defense -= increase_defense;
    obj_player.lifesteal += minus_lifesteal;
}