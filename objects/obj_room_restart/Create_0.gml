
orig_room = room;
if (set_persistent) {
    room_persistent = false;
}

temp_room = room_add();
room_goto(temp_room);