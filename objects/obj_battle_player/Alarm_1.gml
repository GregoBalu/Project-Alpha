//attack move back
x -= attack_move;
if (x > xstart) {
    alarm[BattlePlayerEvents.AttackBack] = (1/60) * TIME_SECOND;
} else {
    alarm[BattlePlayerEvents.MoveReset] = getBattleAfterActionCooldownSeconds() * TIME_SECOND;
}