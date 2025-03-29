//After player attack
if (damage_to_enemy.damage > 0) {
    var _actual_dmg = obj_battle_enemy.take_damage(damage_to_enemy.damage, damage_to_enemy.did_crit);
    if (obj_battle_player.data.lifesteal > 0) {
        obj_battle_player.take_damage(-_actual_dmg*obj_battle_player.data.lifesteal, damage_to_enemy.did_crit);
    }
}

obj_battle_player.tick_turn(false);
obj_battle_enemy.tick_turn(false);

if (check_for_end()) {
    alarm[BattleManagerEvents.BattleEnd] = TIME_SECOND;
} else {
    alarm[BattleManagerEvents.EnemyAttack] = TIME_SECOND;
}
