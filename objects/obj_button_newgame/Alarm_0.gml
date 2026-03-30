if (audio_group_is_loaded(ag_sfx)) {
    change_room_to(rm_dungeon, RoomTransition.Fade);
} else {
    alarm[0] = 10
}