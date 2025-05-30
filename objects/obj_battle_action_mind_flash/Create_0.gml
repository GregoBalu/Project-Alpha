event_inherited();

hotkey = global.input_battle_ultimate;

action = function() {
    if (!checkCost(cost_type, cost_amount)) {
        return;
    }
    
    obj_battle_player.data.charge_util -= cost_amount;
    
    var res = calc_damage(obj_battle_player.data.damage*damage_multiplier, obj_battle_player.data.crit_chance);
    res.damage += floor(obj_battle_player.data.charge_util) * damage_per_charge;
    var animTime = BattlePlayerAttackAnimationTime;
    obj_battle_manager.player_turn(res, animTime);
    obj_battle_player.play_attack_animation(res.did_crit);
    
    screenshake(0.1*TIME_SECOND, 0.4*TIME_SECOND, 3.5, 0.5);
}

damage_multiplier = 2;
damage_per_charge = 3;


hint = $"Mind Flash [{key2str(hotkey)}]\nA telephatic resonance that affects the weak. Damage is increased based on remaining utility charge.\nCost: {cost_amount}\nDamage (x{damage_multiplier}): {obj_battle_switcher.player_data.damage*damage_multiplier} + rem. uc.x{damage_per_charge}n";