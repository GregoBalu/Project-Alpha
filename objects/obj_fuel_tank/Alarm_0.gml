//auto burn
if (burnFuel()) {
    if (is_on) {
        alarm[0] = 5*TIME_SECOND;
    }
}
