// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Ring;

hp_increase = 5;
original_charge_attack_reduction = 1;
charge_attack_reduction = original_charge_attack_reduction;

name = getText("Item_ring_of_erityc_name");
description = string(getText("Item_ring_of_erityc_desc"), hp_increase, original_charge_attack_reduction);



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