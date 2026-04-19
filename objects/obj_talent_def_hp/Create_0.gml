event_inherited();

action = function() {
    if (checkTalentCost(self)) {
        unlocked = true;
        
        
        ds_list_add(obj_player.unlocked_talents, self);
        obj_player.talent_points -= cost_amount;
        
        obj_player.defense += bonus_defense;
        obj_player.hp_total -= minus_total_hp;
        obj_player.hp = clamp(obj_player.hp, 0, obj_player.hp_total);
    }
}

bonus_defense = 0.3;
minus_total_hp = 2;

name = getText("Talent_def_hp_name");
hint = string(getText("Talent_def_hp_hint"), bonus_defense, minus_total_hp);
