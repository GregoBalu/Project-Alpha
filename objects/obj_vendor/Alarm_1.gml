/// @description Mouse hold treshold timer

if (in_hold) {
    show_debug_message("Hold Fired!");
    hold_action.func(hold_action.context);
    in_hold = false;
    mouse_clear(mb_left);
}
