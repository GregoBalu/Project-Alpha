if (!is_on) exit;

if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true)) {
    if (!show_use) {
        obj_gui.show_use++;
        show_use = true;
    }
    
    if (keyboard_check_pressed(global.input_use)) {
        obj_player.x = target_x;
        obj_player.y = target_y;
        
    }
} else {
    if (show_use) {
        obj_gui.show_use--;
        show_use = false;
    }
}