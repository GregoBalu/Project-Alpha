new_shroud_mask = undefined;
// Inherit the parent event
event_inherited();

if (targetObject.id != obj_player.id) {
    return;
}

new_shroud_mask = shroud_clear_grid_setup(3.5, obj_shroud.clear_grid_size);
targetObject.change_shroud_mask(new_shroud_mask);