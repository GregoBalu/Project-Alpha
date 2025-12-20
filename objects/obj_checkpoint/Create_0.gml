room_created = room;


show_debug_message($"Checkpoint created: {id}, {room_created}");

if (save_on_create) {
    with (obj_player) {
        save_player_data_to(self);
    }
}
