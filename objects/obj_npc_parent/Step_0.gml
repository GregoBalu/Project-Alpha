if (instance_exists(obj_dialog)) exit;
    
if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) {
    if (!can_talk) {
        can_talk = true;
        obj_gui.show_talk++;
    }
    
    if (keyboard_check_pressed(input_key)) {
        if (used_dialog && dialog_alt != -1) {
            create_dialog(dialog_alt);
        } else {
            create_dialog(dialog);
        }
        used_dialog = true;
    }
} else {
    if (can_talk) {
        can_talk = false;
        obj_gui.show_talk--;
    }
}