// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Ring;

crit_increase = 0.3;
dmg_decrease = 4;


name = "Ring of Sorrow";
description = $"This ring brings great sadness\nCrit chance: +{crit_increase*100}%\nDamage: -{dmg_decrease}";



function equip() {
    obj_player.crit_chance += crit_increase;
    obj_player.damage -= dmg_decrease;
}
function unequip() {
    obj_player.crit_chance -= crit_increase;
    obj_player.damage += dmg_decrease;
}