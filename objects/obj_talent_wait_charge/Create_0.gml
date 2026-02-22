event_inherited();

function action() {
    if (checkTalentCost(self)) {
        unlocked = true;
        
        ds_list_add(obj_player.unlocked_talents, self);
        obj_player.talent_points -= cost_amount;
        
    }
}

bonus_attack_charge = 0.2;
minus_utility_charge = 0.2;

name = getText("Talent_wait_charge_name");
hint = string(getText("Talent_wait_charge_hint"), bonus_attack_charge, minus_utility_charge);
