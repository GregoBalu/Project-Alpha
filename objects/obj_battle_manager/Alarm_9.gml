if (background_subimg < obj_battle_enemy.data.battle.battle_screen_animated_max_frames-1) {
    background_subimg++
    alarm[9] =  (TIME_SECOND/obj_battle_enemy.data.battle.battle_screen_animated_fps);
} else {
    battle_started = true;
}