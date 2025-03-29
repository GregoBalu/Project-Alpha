if (instance_exists(obj_dialog)) exit;

if (keyboard_check(global.input_playersheet)) {
    if (state == State.Closed) {
        state = State.Opening;
        opening_state = min_open_state;
    } else if (state == State.Opening) {
        state = State.Closing;
    } else if (state == State.Open) {
        state = State.Closing;
        opening_state = max_open_state;
    } else {
        state = State.Opening;
    }
}