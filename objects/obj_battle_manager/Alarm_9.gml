if (background_subimg < 13) {
    background_subimg++
    alarm[9] = 0.1*TIME_SECOND;
} else {
    battle_started = true;
}