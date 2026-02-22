// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Weapon;

lifesteal_bonus = 0.15;
speed_decrease = 0.3;

name = getText("Item_saber_of_many_edges_name");
description = string(getText("Item_saber_of_many_edges_desc"), lifesteal_bonus*100, speed_decrease);



function equip() {
    obj_player.lifesteal += lifesteal_bonus;
    obj_player.move_speed -= speed_decrease;
}
function unequip() {
    obj_player.lifesteal -= lifesteal_bonus;
    obj_player.move_speed += speed_decrease;
}