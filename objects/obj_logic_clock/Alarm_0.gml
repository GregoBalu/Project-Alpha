//Clock Timer fire
if (!is_on) {
    return;
}

if (current_cycle == Cycle.On) {
    activate_inst.On(id);
    current_cycle = Cycle.Off;
} else {
    activate_inst.Off(id);
    current_cycle = Cycle.On;
}

if (is_on) {
    alarm[0] = clock_timer_seconds * TIME_SECOND;
}