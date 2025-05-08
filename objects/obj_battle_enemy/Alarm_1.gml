//Animate to Right (back)
alarm[5] = 0;
x += attack_move;

if (x < xstart) {
    alarm[BattleEnemyEvents.AttackBack] = (1/60) * TIME_SECOND;
} else {
    alarm[BattleEnemyEvents.MoveReset] = getBattleAfterActionCooldownSeconds() * TIME_SECOND;
}