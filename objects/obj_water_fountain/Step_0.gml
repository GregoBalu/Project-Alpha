if (is_plugged) {
    if (point_distance(x, y, plugged_by.x, plugged_by.y) > sprite_width/2) {
        plugged_by = noone;
        is_plugged = false;
        
        if (instance_exists(activate_inst)) {
            activate_inst.Off(id);
        }
        
        image_index = 1;
        image_speed = 1;
    }
}
