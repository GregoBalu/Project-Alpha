if (room != orig_room) {
    if (set_persistent) {
        room_set_persistent(orig_room, true);
    }
    change_room_to(orig_room, RoomTransition.Instant);//Here simple goto, as we do not want any delayed animation in the temp room
} else {
    instance_destroy();
}