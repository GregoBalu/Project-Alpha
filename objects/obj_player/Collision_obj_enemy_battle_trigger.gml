if (instance_exists(obj_battle_switcher)) exit;
if (!other.valid()) exit;

var _enemy = other.enemy;

    
show_debug_message($"obj_player [Collision] obj_enemy_battle_trigger {_enemy}");
log_stat($"obj_player [Collision] obj_enemy_battle_trigger {_enemy}");

var _switcher = instance_create_depth(0, 0, 0, obj_battle_switcher);

_switcher.player_data = self;
with (_enemy) {
    _switcher.enemy_data = self;
}
_switcher.original_room = room;

show_debug_message($"Battle start go from {room}");
room_goto(rm_battle);