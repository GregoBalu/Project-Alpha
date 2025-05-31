
if (!canUse()) {
    image_alpha = .2;
} else {
    image_alpha = 1;
}

if (hotkey != undefined && keyboard_check_pressed(hotkey)) {
    if (!canUse()) exit;

    action();
}