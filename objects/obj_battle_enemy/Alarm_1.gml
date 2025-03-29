//Animate to Right (back)
x += attack_move;

if (x < xstart) {
    alarm[BattleEnemyEvents.AttackBack] = (1/60) * TIME_SECOND;
} else {
    alarm[BattleEnemyEvents.MoveReset] = getBattleAfterActionCooldownSeconds() * TIME_SECOND;
}