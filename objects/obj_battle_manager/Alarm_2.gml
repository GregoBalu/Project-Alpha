//After enemy attack

obj_battle_player.tick_turn(true);
obj_battle_enemy.tick_turn(true);

if (check_for_end()) {
    alarm[BattleManagerEvents.BattleEnd] = TIME_SECOND;
    return;
}

++turn;

if (obj_battle_player.is_stunned) {
    damage_to_enemy = {damage:0,did_crit:false};
    alarm[BattleManagerEvents.AfterPlayerAttack] = (getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
} else {
    enemy_turn = false;
}

if (check_for_end()) {
    alarm[BattleManagerEvents.BattleEnd] = TIME_SECOND;
}
