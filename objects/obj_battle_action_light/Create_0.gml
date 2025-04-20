event_inherited();

crit_chance = obj_battle_switcher.player_data.crit_chance;
charge_gain = 0.4;

good_damage_percent = 1;
damage_modifier = 1;

for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_light_crit) {
        crit_chance += _talent.crit_increase;
        charge_gain -= _talent.charge_decrease;
    } else if (_talent.object_index == obj_talent_light_rng) {
        good_damage_percent = _talent.good_percent;
        damage_modifier = _talent.damage_modifier;
    }
}

action = function() {
    var res = calc_damage(obj_battle_player.data.damage, crit_chance);
    if (good_damage_percent < 1) {
        if (random_range(0, 1) < good_damage_percent) {
            res.damage = res.damage * damage_modifier;
        } else {
            res.damage = res.damage * (1/damage_modifier);
        }
    }
    
    var animTime = BattlePlayerAttackAnimationTime;
    obj_battle_manager.player_turn(res, animTime);
    obj_battle_player.play_attack_animation(res.did_crit);
    alarm[0] = (animTime + getBattleAfterActionCooldownSeconds()) * TIME_SECOND;
}

hint = string("A light attack.\nDamage: {0}\nCrit chance: {1}%\nCharge gain: {2} attack", obj_battle_switcher.player_data.damage, crit_chance*100, charge_gain);