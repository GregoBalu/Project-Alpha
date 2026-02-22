// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Armor;

bonus_corruption_resistance = 0.4;
minus_move_speed = 0.4;

name = getText("Item_robe_of_voices_name");
description = string(getText("Item_robe_of_voices_desc"), bonus_corruption_resistance*100, minus_move_speed);



function equip() {
    obj_player.corruption_resistance += bonus_corruption_resistance;
    obj_player.move_speed -= minus_move_speed;
    
}
function unequip() {
    obj_player.corruption_resistance -= bonus_corruption_resistance;
    obj_player.move_speed += minus_move_speed;
}