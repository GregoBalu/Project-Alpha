if (show_gold_change) {
    --gold_change_tick;
    if (gold_change_value >= 0) {
        gold_change_y -= .1;
    } else {
        gold_change_y += .1;
    }
    
    if (gold_change_tick <= 0) {
        gold_change_tick = 0;
        show_gold_change = false;
    }
}

if (in_hold) {
    if (mouse_check_button_released(mb_left)) {
        stopHold();
    }
}