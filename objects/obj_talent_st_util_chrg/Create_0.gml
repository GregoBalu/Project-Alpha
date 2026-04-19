// Inherit the parent event
event_inherited();

max_utility_charge_increase = 0.3;

max_stacks = 5;
name = getText("Talent_st_util_chrg_name");
hint = string(getText("Talent_st_util_chrg_hint"), max_utility_charge_increase);

effect = function() {

    obj_player.charge_util_total += max_utility_charge_increase;
}