//Battle end
obj_battle_player.tick_stop();
obj_battle_enemy.tick_stop();

show_debug_message($"Battle end, back to {obj_battle_switcher.original_room}")
room_goto(obj_battle_switcher.original_room);