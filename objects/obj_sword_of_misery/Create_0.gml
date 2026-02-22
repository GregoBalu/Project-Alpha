// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Weapon;

bonus_damage = 2;
original_crit_reduction = 0.1;
crit_reduction = original_crit_reduction;

name = getText("Item_sword_of_misery_name");
description = string(getText("Item_sword_of_misery_desc"), bonus_damage, original_crit_reduction*100);


function equip() {
    obj_player.damage += bonus_damage;
    crit_reduction = min(obj_player.crit_chance, original_crit_reduction);
    obj_player.crit_chance -= crit_reduction;
}
function unequip() {
    obj_player.damage -= bonus_damage;
    obj_player.crit_chance += crit_reduction;
}