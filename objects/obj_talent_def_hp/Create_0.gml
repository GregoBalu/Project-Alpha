event_inherited();

function action() {
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

name = "Guards up!";
hint = string("defense: +{0}\ntotal health: -{1}", bonus_defense, minus_total_hp);
