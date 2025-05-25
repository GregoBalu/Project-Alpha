function action() {
    if (checkTalentCost(self)) {
        if (!unlocked) {
            unlocked = true;
            
            ds_list_add(obj_player.unlocked_talents, self);
            obj_player.talent_points -= cost_amount;
            
            effect();
        }
    }
}

function effect() {
    //TODO: override this
}

name = "Talent name";
hint = "TODO: hint";
unlocked = false;
stackable = false;
