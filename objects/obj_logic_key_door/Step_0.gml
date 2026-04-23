if (opened) exit;
    
_background_sprite_time++;

var _dist = distance_to_object(obj_player);
//var _dir = point_direction(x, y, obj_player.x, obj_player.y);

if (_dist <= 0) {
    if (!showed_use) {
        showed_use = true;
        obj_gui.show_use++;
    }
    
    if (keyboard_check_pressed(global.input_use)) {
        if (obj_player.key_ring.has(door_color)) {
            obj_player.key_ring.remove(door_color);
            
            On(id);
        }
    }
} else {
    if (showed_use) {
        showed_use = false;
        obj_gui.show_use--;
    }
}