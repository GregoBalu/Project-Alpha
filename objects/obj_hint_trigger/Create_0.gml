initDialog();

if (!variable_global_exists("show_hints")) {
    global.show_hints = true;
} else if (!global.show_hints) {
    instance_destroy();
    return;
}

is_triggered = false;

visible = false;