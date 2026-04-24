if (instance_exists(obj_dialog) || instance_exists(obj_vendor) || instance_exists(obj_battle_switcher)) exit;
    
if (global.do_pause) exit;
    
if (hp <= 0 || other.hp <= 0) exit;
    
show_debug_message($"obj_player [Collision] obj_enemy_base {other}");
log_stat($"obj_player [Collision] obj_enemy_base {other}");

var _switcher = instance_create_depth(0, 0, 0, obj_battle_switcher);

_switcher.player_data = self;
_switcher.enemy_data = other;
_switcher.original_room = room;

show_debug_message($"Battle start go from {room}");
change_room_to(rm_battle, RoomTransition.Spiral);