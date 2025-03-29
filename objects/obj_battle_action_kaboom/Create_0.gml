event_inherited();

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

hint = string("An ultimate attack.\nCost: {0} each\nDamage (x{1}): {2}\nCrit: (x{3}): {4}%\nDecrease charge attack by: {5}", 
        cost_amount, 
        damage_multiplier, 
        obj_battle_switcher.player_data.damage*damage_multiplier, 
        crit_multiplier,
        obj_battle_player.data.crit_chance*crit_multiplier*100,
        charge_decrement);