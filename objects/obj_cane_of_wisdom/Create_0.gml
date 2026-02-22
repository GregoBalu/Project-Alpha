// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Weapon;

bonus_max_utility_charge = 2;
minus_damage = 1.5;

name = getText("Item_cane_of_wisdom_name");
description = string(getText("Item_cane_of_wisdom_desc"), bonus_max_utility_charge, minus_damage);



function equip() {
    obj_player.charge_util_total += bonus_max_utility_charge;
    obj_player.damage -= minus_damage;
}
function unequip() {
    obj_player.charge_util_total -= bonus_max_utility_charge;
    obj_player.damage += minus_damage;
}