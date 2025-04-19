// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Weapon;

hp_increase = 5;
original_charge_attack_reduction = 1;
charge_attack_reduction = original_charge_attack_reduction;

name = "Ring of Erityc";
description = $"This ring was that thought to be unobtainable.\nHealth: +{hp_increase}\nAttack charge gain: -{original_charge_attack_reduction}";



function equip() {
    obj_player.hp += hp_increase;
    obj_player.hp_total += hp_increase;
    charge_attack_reduction = min(obj_player.charge_attack_total, original_charge_attack_reduction);
    obj_player.charge_attack_total -= charge_attack_reduction;
}
function unequip() {
    obj_player.hp_total -= hp_increase;
    obj_player.hp -= hp_increase;
    obj_player.charge_attack_total += charge_attack_reduction;
    charge_attack_reduction = original_charge_attack_reduction;
}