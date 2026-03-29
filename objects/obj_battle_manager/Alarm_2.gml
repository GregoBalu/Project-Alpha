/// After enemy attack

show_debug_message("After enemy attack");
obj_battle_player.tick_turn(true);
obj_battle_enemy.tick_turn(true);

if (check_for_end()) {
    show_debug_message("Going to battle end ...");
    alarm[BattleManagerEvents.BattleEnd] = TIME_SECOND;
    return;
}

++turn;

if (obj_battle_player.is_stunned) {
    show_debug_message("Player is stunned");
    damage_to_enemy = {damage:0,did_crit:false};
    show_debug_message("Going to after player attack ...");
    alarm[BattleManagerEvents.AfterPlayerAttack] = (getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
} else {
    enemy_turn = false;
}

if (check_for_end()) {
    show_debug_message("Going to battle end ...");
    alarm[BattleManagerEvents.BattleEnd] = TIME_SECOND;
}
