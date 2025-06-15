if (instance_exists(obj_dialog) || global.do_pause) exit;

if (state == ButtonState.Hover) {
    state = ButtonState.Normal;
}