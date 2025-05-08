//Animate to Left
alarm[5] = 0;
battle_player_damaged_stars.visible = true;

x -= attack_move;

if (x < xstart - attack_distance) {
    alarm[BattleEnemyEvents.AttackBack] = (1/60) * TIME_SECOND;
} else {
    alarm[BattleEnemyEvents.AttackStart] = (1/60) * TIME_SECOND;
}