// Inherit the parent event
event_inherited();

if (new_shroud_mask != undefined) {
    targetObject.change_shroud_mask(targetObject.default_shroud_mask);
    ds_grid_destroy(new_shroud_mask);
}