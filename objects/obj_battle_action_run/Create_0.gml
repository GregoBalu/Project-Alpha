event_inherited();

action = function() {
    obj_battle_player.data.hp -= choose(0, 0, 0, 0, 0, 0.5, 0.5, 1);
    obj_battle_manager.alarm[3] = 10;
}

hint = "Escape from battle";