event_inherited();

damage_modifier = 2;
charge_gain = 0.2;

for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_heavy_cheap) {
        cost_amount -= _talent.cost_reduction;
        damage_modifier *= _talent.damage_reduces_scaling;
    }
}

hint = $"A charged up heavy attack.\nCost: {cost_amount}\nDamage modifier: {damage_modifier}\nCharge gain: {charge_gain} attack";

action = function() {
    if (checkCost(cost_type, cost_amount)) {
        obj_battle_player.data.charge_attack -= cost_amount;
        
        var res = calc_damage(obj_battle_player.data.damage*damage_modifier, obj_battle_player.data.crit_chance);
        var animTime = BattlePlayerAttackAnimationTime;
        obj_battle_manager.player_turn(res, animTime);
        obj_battle_player.play_attack_animation(res.did_crit);
        alarm[0] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
        
        screenshake(0.1*TIME_SECOND, 0.2*TIME_SECOND, 1.5, 0.5);
    }
}

