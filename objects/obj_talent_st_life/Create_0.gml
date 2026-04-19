// Inherit the parent event
event_inherited();

health_increase = 1;

max_stacks = 5;
name = getText("Talent_st_life_name");
hint = string(getText("Talent_st_life_hint"), health_increase);

effect = function() {

    obj_player.hp_total += health_increase;
    obj_player.hp += health_increase;
}