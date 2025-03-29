visible = false;

is_on = start_on;

enum Cycle { On, Off };
current_cycle = first_cycle;


On = function(_inst_id) {
    if (is_on) {
        return;
    }
    is_on = true;
};

Off = function(_inst_id) {
    if (!is_on) {
        return;
    }
    is_on = false;
    alarm[0] = 0;
};


if (is_on) {
    alarm[0] = delay_seconds * TIME_SECOND + clock_timer_seconds * TIME_SECOND;
}