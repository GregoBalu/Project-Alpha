// Inherit the parent event
event_inherited();

if (!variable_global_exists("show_hints")) {
    global.show_hints = true;
}

init = function() {
    checked = global.show_hints;
    refresh_image();
}

onChanged = function() {
    // override me
    global.show_hints = checked;
}

init();