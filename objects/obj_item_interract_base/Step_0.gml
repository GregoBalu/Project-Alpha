if (can_interract && !interract_as_collision) {
    if (state == InterractItemState.Undisturbed && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true)) {
        if (!show_use) {
            obj_gui.show_use++;
            show_use = true;
        }
        if (keyboard_check_pressed(global.input_use)) {
            onInterract();
            if (show_use) {
                obj_gui.show_use--;
                show_use = false;
            }
            state = InterractItemState.Interracted;
        }
        return;
    }
}

if (show_use) {
    obj_gui.show_use--;
    show_use = false;
}