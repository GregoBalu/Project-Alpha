if (room == room_id && changed_room) {
    show_debug_message("Room change manager effect in");
    if (do_out) {
        doEffect();
    } else {
        instance_destroy();
    }
}