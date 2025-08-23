

if (stage == max_stage) {
    
    if ( distance_to_object(obj_player) < 10) {
    
        if (!show_used) {
            show_used = true;
            obj_gui.show_use++;
        }
        if (keyboard_check_pressed(global.input_use)) {
            use();
        }
    } else {
        if (show_used) {
            show_used = false;
            obj_gui.show_use--;
        }
    }
}