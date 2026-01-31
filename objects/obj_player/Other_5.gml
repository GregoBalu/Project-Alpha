
if (room == rm_castle) {
    shroud_radius_base -= 1;
}

if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    save_player_data_to(_inst);
}

