// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Weapon;

bonus_damage = 5;
original_crit_reduction = 0.1;
crit_reduction = original_crit_reduction;

name = "Sword of Misery";
description = $"This light blade has caused a lot of suffering on either end of it.\nDamage: +{bonus_damage}\nCrit chance: -{original_crit_reduction*100}%";



function equip() {
    obj_player.damage += bonus_damage;
    crit_reduction = min(obj_player.crit_chance, original_crit_reduction);
    obj_player.crit_chance -= crit_reduction;
}
function unequip() {
    obj_player.damage -= bonus_damage;
    obj_player.crit_chance += crit_reduction;
}