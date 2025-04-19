// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Weapon;

bonus_max_utility_charge = 2;
minus_damage = 1.5;

name = "Crane of Wisdom";
description = $"This short staff is making you think like a wizard.\nTotal utility charges: +{bonus_max_utility_charge}\nDamage: -{minus_damage}";



function equip() {
    obj_player.charge_util_total += bonus_max_utility_charge;
    obj_player.damage -= minus_damage;
}
function unequip() {
    obj_player.charge_util_total -= bonus_max_utility_charge;
    obj_player.damage += minus_damage;
}