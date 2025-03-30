if (!is_triggered) {
    is_triggered = true;
    
    with(obj_hint_trigger) {
        if (hint_id == other.hint_id) {
            is_triggered = true;
        }
    }
    
    create_dialog([new dialog_entry("Hint", c_white, hint_sprite, hint)]);
}