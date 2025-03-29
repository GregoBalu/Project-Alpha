//attack move forward
battle_enemy_damaged_stars.visible = true;

x += attack_move;

if (x > xstart + attack_distance) {
    alarm[BattlePlayerEvents.AttackBack] = (1/60) * TIME_SECOND;
} else {
    alarm[BattlePlayerEvents.AttackStart] = (1/60) * TIME_SECOND;
}