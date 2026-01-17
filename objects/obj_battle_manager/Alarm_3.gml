///Battle end
obj_battle_player.tick_stop();
obj_battle_enemy.tick_stop();

show_debug_message($"Battle end, back to {obj_battle_switcher.original_room}")
change_room_to(obj_battle_switcher.original_room, RoomTransition.Spiral);