if (distance_to_object(obj_player) < 8) {
    if (!is_near) {
        obj_gui.show_use++;
        is_near = true;
    }
    
    if (keyboard_check_pressed(global.input_use)) {
        is_on = !is_on;
        
        if (is_on) {
            image_index = 1;
            
            if (instance_exists(activate_inst)) {
                activate_inst.On(id);
            }
        } else {
            image_index = 0;
            if (instance_exists(activate_inst)) {
                activate_inst.Off(id);
            }
        }
    }
} else {
    if (is_near) {
        obj_gui.show_use--;
        is_near = false;
    }
}