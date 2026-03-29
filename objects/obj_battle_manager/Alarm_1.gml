/// On enemy attack

show_debug_message("Before enemy attack");
var animTime = 0;
if (!obj_battle_enemy.is_stunned) {
    animTime = obj_battle_enemy.data.doEnemyAction(obj_battle_enemy.data, obj_battle_player.data);
    show_debug_message($"Enemy doAction returned {animTime}");
} else {
    show_debug_message("Enemy is stunned");
}

alarm[BattleManagerEvents.AfterEnemyAttack] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
show_debug_message($"Going to after enemy attack ... {alarm[BattleManagerEvents.AfterEnemyAttack]}");
