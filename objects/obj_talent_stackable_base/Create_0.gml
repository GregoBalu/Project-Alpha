// Inherit the parent event
event_inherited();

stackable = true;

current_stack = 0;
max_stacks = 2;

action = function() {
    if (checkTalentCost(self)) {
        obj_player.talent_points -= cost_amount;
        ++current_stack;
        if (!unlocked) {
            unlocked = true;
            
            ds_list_add(obj_player.unlocked_talents, self);
            effect();
        } else {
            if (current_stack < max_stacks) {
                effect();
            }
        }
    }
}