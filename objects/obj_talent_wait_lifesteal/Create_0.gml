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

name = getText("Talent_wait_lifesteal_name");
hint = string(getText("Talent_wait_lifesteal_hint"), bonus_lifesteal*100, minus_charge);
