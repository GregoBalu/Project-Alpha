event_inherited();

function action() {
    if (checkTalentCost(self)) {
        unlocked = true;
        
        ds_list_add(obj_player.unlocked_talents, self);
        obj_player.talent_points -= cost_amount;
        
    }
}

bonus_lifesteal = 0.3;
lifesteal_turns = 4;
minus_charge = 0.1;

name = "Worth the wait";
hint = string("lifesteal: +{0}%\ncharge gain decrease: -{1}", bonus_lifesteal*100, minus_charge);
