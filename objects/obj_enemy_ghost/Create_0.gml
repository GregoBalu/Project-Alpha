// Inherit the parent event
event_inherited();

audio_play_sound(snd_ghost_aggro, AUDIO_PRIO_NOISE, false, 1.0, 0.3);

doEnemyAction = function(_selfData, _playerData) {
    var _select = random_range(0, 10);
        
    if (_selfData.charge_attack >= 1) _select++;
    if (_selfData.charge_attack >= 2) _select++;
    if (_selfData.charge_util >= 1) _select++;
    if (_selfData.charge_util >= 2) _select++;
    
    if (_select < 5) {
        
        var _enemy_damage = calc_damage(obj_battle_enemy.data.damage, obj_battle_enemy.data.crit_chance);
        var _animTime = BattleEnemyAttackAnimationTime;
        
        audio_play_sound(snd_ghost_attack, AUDIO_PRIO_EFFECTS, false, 1.0, 0.2);
        var _actual_dmg = obj_battle_player.take_damage(_enemy_damage.damage, _enemy_damage.did_crit);
        if (obj_battle_enemy.data.lifesteal > 0) {
            obj_battle_enemy.take_damage(-_actual_dmg*obj_battle_enemy.data.lifesteal, _enemy_damage.did_crit);
        }
        obj_battle_enemy.play_attack_animation(_enemy_damage.did_crit);
        
        obj_battle_enemy.data.charge_util = clamp(obj_battle_enemy.data.charge_util + .4, 0, obj_battle_enemy.data.charge_util_total);
        
        return _animTime;
    } else if (_selfData.charge_util >= 1) {
        if (_select < 3) {
            return enemyInterruptAttack(obj_battle_enemy);
        } else {
            return enemyCastCorruptionBolt(1.2, obj_battle_enemy);
        }
    } else {
        return enemyWait(obj_battle_enemy);
    }
}

onBattleDamageReceived = function(_damaged_amount) {
    if (_damaged_amount > 0) {
        audio_play_sound(snd_ghost_damaged, AUDIO_PRIO_EFFECTS, false, 1.0, 0.3);
    }
}
onDeath = function() {
    if (DEBUG) show_debug_message("enemy dead ghost");
    obj_loottable.generate_loot(self);
    obj_player.gain_experience(self);
    obj_player.add_corruption(-5);
    instance_destroy();
    exit;
}