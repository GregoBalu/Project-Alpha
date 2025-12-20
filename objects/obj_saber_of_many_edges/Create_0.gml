// Inherit the parent event
event_inherited();

is_equipable = true;


equip_slot = EquipSlot.Weapon;

lifesteal_bonus = 0.15;
speed_decrease = 0.3;

name = "Saber of many edges";
description = $"This saber is a potent and sharp weapon for those who know how to use it.\nLifesteal: +{lifesteal_bonus*100}%\nSpeed: -{speed_decrease}";



function equip() {
    obj_player.lifesteal += lifesteal_bonus;
    obj_player.move_speed -= speed_decrease;
}
function unequip() {
    obj_player.lifesteal -= lifesteal_bonus;
    obj_player.move_speed += speed_decrease;
}