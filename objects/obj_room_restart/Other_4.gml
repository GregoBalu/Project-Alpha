if (room != orig_room) {
    if (set_persistent) {
        room_set_persistent(orig_room, true);
    }
    room_goto(orig_room);
} else {
    instance_destroy();
}