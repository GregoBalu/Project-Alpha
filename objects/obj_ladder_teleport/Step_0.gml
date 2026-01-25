if (paused) exit;
    
if (point_in_rectangle(obj_player.x, obj_player.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    if (!show_use) {
        show_use = true;
        obj_gui.show_use++;
    }
    
    if (keyboard_check_pressed(global.input_use)) {
        if (other_end != noone) {
            show_debug_message($"{id} - Teleport to {other_end.x},{other_end.y}");
            keyboard_clear(global.input_use);
            obj_player.x = other_end.cx;
            obj_player.y = other_end.cy;
            
            
            
            show_use = false;
            obj_gui.show_use--;
        }
    }
    
} else {
    if (show_use) {
        show_use = false;
        obj_gui.show_use--;
    }
}