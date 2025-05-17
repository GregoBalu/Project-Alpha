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

if (data.battle.idle_sound != noone) {
    alarm[5] = random_range(data.battle.idle_sound_min_seconds, data.battle.idle_sound_max_seconds) * TIME_SECOND;
}

play_attack_animation = function(_did_crit) {
    alarm[5] = 0;
    if (_did_crit) {
        battle_enemy_crit_noti.visible = true;
    }
    
    if (data.battle.animation_attack == noone) {
        if (_did_crit) {
            attack_move = 3;
            attack_distance = 30;
        } else {
            attack_move = 2;
            attack_distance = 20;
        }
        alarm[BattleEnemyEvents.AttackStart] = 0.1 * TIME_SECOND;
        return 0.333;
    } else {
        sprite_index = data.battle.animation_attack;
        image_index = 0;
        var _total_frames = sprite_get_number(data.battle.animation_attack);
        var _speed = data.battle.animation_attack_fps;
        var _animTime = (_total_frames / _speed);
        alarm[BattleEnemyEvents.MoveReset] = (_animTime) * TIME_SECOND;
        return _animTime;
    }
}

function play_heavyattack_animation(_did_crit) {
    alarm[5] = 0;
    if (_did_crit) {
        attack_move = 3;
        attack_distance = 30;
        battle_enemy_crit_noti.visible = true;
    } else {
        attack_move = 2;
        attack_distance = 20;
    }
    alarm[BattleEnemyEvents.AttackStart] = 0.1 * TIME_SECOND;
    return 0.333;
}

play_wait_animation = function() {
    alarm[5] = 0;
    battle_enemy_wait_noti.visible = true;
    battle_enemy_wait_noti.image_index = 0;
    
    if (data.battle.animation_wait == noone) {
        alarm[BattleEnemyEvents.MoveReset] = BattleEnemyWaitAnimationTime * TIME_SECOND;
        return BattleEnemyWaitAnimationTime;
    } else {
        sprite_index = data.battle.animation_wait;
        image_index = 0;
        var _total_frames = sprite_get_number(data.battle.animation_wait);
        var _speed = data.battle.animation_wait_fps;
        var _animTime = (_total_frames / _speed);
        alarm[BattleEnemyEvents.MoveReset] = (_animTime) * TIME_SECOND;
        return _animTime;
    }
}

function play_cast_animation(_did_crit) {
    alarm[5] = 0;
    if (data.battle.animation_cast == noone) {
        if (_did_crit) {
            attack_move = 3;
            attack_distance = 30;
            battle_enemy_crit_noti.visible = true;
        } else {
            attack_move = 2;
            attack_distance = 20;
        }
        alarm[BattleEnemyEvents.AttackStart] = 0.1 * TIME_SECOND;
        return 0.333;
    } else {
        sprite_index = data.battle.animation_cast;
        image_index = 0;
        var _total_frames = sprite_get_number(data.battle.animation_cast);
        var _speed = data.battle.animation_cast_fps;
        var _animTime = (_total_frames / _speed);
        alarm[BattleEnemyEvents.MoveReset] = (_animTime) * TIME_SECOND;
        return _animTime;
    }
}

data.initBattle();
