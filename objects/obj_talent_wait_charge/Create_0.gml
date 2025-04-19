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

name = "Tip of balance";
hint = string($"attack charge gain increase: +{bonus_attack_charge}\nutility charge gain decrease: -{minus_utility_charge}");
