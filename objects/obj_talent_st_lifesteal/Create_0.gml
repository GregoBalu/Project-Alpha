// Inherit the parent event
event_inherited();

lifesteal_increase = 0.05;

max_stacks = 5;
name = getText("Talent_st_lifesteal_name");
hint = string(getText("Talent_st_lifesteal_hint"), lifesteal_increase*100);

effect = function() {

    obj_player.lifesteal += lifesteal_increase;
}