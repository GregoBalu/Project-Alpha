/// @description Mouse hold treshold timer

if (in_hold) {
    show_debug_message("Hold Fired!");
    hold_action.func(hold_action.context);
    is_short_hold = false;
    in_hold = false;
    mouse_clear(mb_left);
}
