if (instance_exists(obj_dialog) || instance_exists(obj_vendor) || global.do_pause) exit;

if (state == ButtonState.Hover) {
    state = ButtonState.Normal;
}