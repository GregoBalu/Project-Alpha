
orig_room = room;
if (set_persistent) {
    room_persistent = false;
}

temp_room = room_add();
change_room_to(temp_room, RoomTransition.Fade);