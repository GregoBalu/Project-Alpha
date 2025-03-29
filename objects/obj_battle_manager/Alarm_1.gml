//on enemy attack
var animTime = 0;
if (!obj_battle_enemy.is_stunned) {
    animTime = obj_battle_enemy.data.doEnemyAction(obj_battle_enemy.data, obj_battle_player.data);
}

alarm[BattleManagerEvents.AfterEnemyAttack] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;

