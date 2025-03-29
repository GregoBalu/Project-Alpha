
enum BattleManagerEvents {
    AfterPlayerAttack = 0,
    EnemyAttack = 1,
    AfterEnemyAttack = 2,
    BattleEnd = 3
};

turn = 0;
time = 0;

battle_started = false;
background_subimg = 0;

enemy_turn = false;
damage_to_enemy = { damage:0,did_crit:false};

player_turn = function(_damage, _player_animation_seconds) {
    if (_damage != undefined) {
        damage_to_enemy = _damage;
    } else {
        damage_to_enemy = {damage:0,did_crit:false};
    }
    enemy_turn = true;
    
    alarm[BattleManagerEvents.AfterPlayerAttack] = (_player_animation_seconds + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
}

check_for_end = function() {
    return (obj_battle_enemy.data.hp <= 0 || obj_battle_player.data.hp <= 0);
}
