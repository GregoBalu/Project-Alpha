
event_inherited();

enum BattlePlayerEvents {
    AttackStart = 0,
    AttackBack = 1,
    MoveReset = 10
};
#macro BattlePlayerAttackAnimationTime  0.2
#macro BattlePlayerWaitAnimationTime    1

data = obj_battle_switcher.player_data;
attack_move = 2;
attack_distance = 20;

play_attack_animation = function(_did_crit) {
    if (_did_crit) {
        attack_move = 3;
        attack_distance = 30;
        battle_player_crit_noti.visible = true;
    } else {
        attack_move = 2;
        attack_distance = 20;
    }
    alarm[BattlePlayerEvents.AttackStart] = 0.1 * TIME_SECOND;
}

play_wait_animation = function() {
    battle_player_wait_noti.visible = true;
    battle_player_wait_noti.image_index = 0;
    alarm[BattlePlayerEvents.MoveReset] = BattlePlayerWaitAnimationTime * TIME_SECOND;
}

