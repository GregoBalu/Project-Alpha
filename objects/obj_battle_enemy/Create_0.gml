event_inherited();

enum BattleEnemyEvents {
    AttackStart = 0,
    AttackBack = 1,
    MoveReset = 10
};
#macro BattleEnemyAttackAnimationTime  0
#macro BattleEnemyWaitAnimationTime    0.8

data = obj_battle_switcher.enemy_data;
sprite_index = data.sprite_index;
image_xscale = data.image_xscale;
image_yscale = data.image_yscale;

y -= sprite_height/2;

attack_move = 2;
attack_distance = 20;

battle_enemy_wait_noti.image_speed = battle_enemy_wait_noti.image_speed*(1.0/BattleEnemyWaitAnimationTime);

play_attack_animation = function(_did_crit) {
    if (_did_crit) {
        attack_move = 3;
        attack_distance = 30;
        battle_enemy_crit_noti.visible = true;
    } else {
        attack_move = 2;
        attack_distance = 20;
    }
    alarm[BattleEnemyEvents.AttackStart] = 0.1 * TIME_SECOND;
}

play_wait_animation = function() {
    battle_enemy_wait_noti.visible = true;
    battle_enemy_wait_noti.image_index = 0;
    
    alarm[BattleEnemyEvents.MoveReset] = BattleEnemyWaitAnimationTime * TIME_SECOND;
}

data.initBattle();
