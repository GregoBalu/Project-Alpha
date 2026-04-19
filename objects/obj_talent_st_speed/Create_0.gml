// Inherit the parent event
event_inherited();

speed_increase = 0.1;

max_stacks = 5;
name = getText("Talent_st_speed_name");
hint = string(getText("Talent_st_speed_hint"), speed_increase);

effect = function() {

    obj_player.move_speed += speed_increase;
}