// Inherit the parent event
event_inherited();

max_charge_increase = 0.2;

max_stacks = 5;
name = getText("Talent_st_atk_chrg_name");
hint = string(getText("Talent_st_atk_chrg_hint"), max_charge_increase);

effect = function() {

    obj_player.charge_attack_total += max_charge_increase;
}