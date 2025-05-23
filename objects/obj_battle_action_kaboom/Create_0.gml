event_inherited();

hotkey = global.input_battle_ultimate;

action = function() {
    if (!checkCost(cost_type, cost_amount)) {
        return;
    }
    
    obj_battle_player.data.charge_attack -= cost_amount;
    obj_battle_player.data.charge_util -= cost_amount;
    
    var res = calc_damage(obj_battle_player.data.damage*damage_multiplier, obj_battle_player.data.crit_chance*crit_multiplier);
    var animTime = BattlePlayerAttackAnimationTime;
    obj_battle_manager.player_turn(res, animTime);
    obj_battle_player.play_attack_animation(res.did_crit);
    alarm[0] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
    
    screenshake(0.1*TIME_SECOND, 0.4*TIME_SECOND, 3.5, 0.5);
}

damage_multiplier = 5;
crit_multiplier = 2;
charge_decrement = 2;

hint = $"Ultimate [{key2str(hotkey)}]\nAn ultimate attack.\nCost: {cost_amount} each\nDamage (x{damage_multiplier}): {obj_battle_switcher.player_data.damage*damage_multiplier}\nCrit: (x{crit_multiplier}): {obj_battle_player.data.crit_chance*crit_multiplier*100}%\nDecrease charge attack by: {charge_decrement}";