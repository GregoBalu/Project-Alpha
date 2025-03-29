// Inherit the parent event
event_inherited();


name = "Sword of Misery";
description = "This light blade has caused a lot of suffering on either end of it.";

is_equipable = true;


equip_slot = EquipSlot.Weapon;

original_crit_reduction = 0.1;
crit_reduction = original_crit_reduction;

function equip() {
    obj_player.damage += 5;
    crit_reduction = min(obj_player.crit_chance, original_crit_reduction);
    obj_player.crit_chance -= crit_reduction;
}
function unequip() {
    obj_player.damage -= 5;
    obj_player.crit_chance += crit_reduction;
}