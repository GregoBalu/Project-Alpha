/// On enemy attack

if (debug_mode) show_debug_message("Before enemy attack");

var animTime = 0;
if (!obj_battle_enemy.is_stunned) {
    animTime = clamp(obj_battle_enemy.data.doEnemyAction(obj_battle_enemy.data, obj_battle_player.data), 0, 10*TIME_SECOND);
    if (debug_mode) show_debug_message($"Enemy doAction returned {animTime}");
} else {
    if (debug_mode) show_debug_message("Enemy is stunned");
}

battle_enemy_turn_noti.fade_out();

alarm[BattleManagerEvents.AfterEnemyAttack] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
if (debug_mode) show_debug_message($"Going to after enemy attack ... {alarm[BattleManagerEvents.AfterEnemyAttack]}");
