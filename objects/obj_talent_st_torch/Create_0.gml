// Inherit the parent event
event_inherited();

radius_increase = 0.5;

max_stacks = 6;
name = getText("Talent_st_torch_name");
hint = string(getText("Talent_st_torch_hint"), radius_increase);

effect = function() {

    obj_player.shroud_radius_extra = clamp(obj_player.shroud_radius_extra + radius_increase, 0, obj_player.shroud_radius_extra_max);
    obj_player.generate_shroud_masks();
}