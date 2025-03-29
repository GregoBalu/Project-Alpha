
if (can_pickup) {
    
    isInCollision = point_distance(x, y, obj_player.x, obj_player.y) < 18;
    if (isInCollision) {
        if (!lastShowState) {
            ++obj_gui.show_use;
            lastShowState = true;
        }
        //show_debug_message("Collision show use");
        
        if (keyboard_check_pressed(global.input_use)) {
            if (carried_by == noone) {
                item_pickup(obj_player);
            } else {
                item_drop(obj_player);
            }
        }
    } else {
        if (lastShowState) {
            --obj_gui.show_use;
            lastShowState = false;
        }
    }
} else {
    isInCollision = false;
    
    if (lastShowState) {
        --obj_gui.show_use;
        lastShowState = false;
    }
}


