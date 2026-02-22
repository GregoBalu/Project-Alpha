// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Ring;

crit_increase = 0.3;
dmg_decrease = 4;


name = getText("Item_ring_of_sorrow_name");
description = string(getText("Item_ring_of_sorrow_desc"), crit_increase*100, dmg_decrease);



function equip() {
    obj_player.crit_chance += crit_increase;
    obj_player.damage -= dmg_decrease;
}
function unequip() {
    obj_player.crit_chance -= crit_increase;
    obj_player.damage += dmg_decrease;
}