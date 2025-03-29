function action() {
    if (checkTalentCost(self)) {
        unlocked = true;
        
        
        ds_list_add(obj_player.unlocked_talents, self);
        obj_player.talent_points -= cost_amount;
    }
}

name = "Talent name";
hint = "TODO: hint";
unlocked = false;
