current_shroud_mask = shroud_clear_grid_setup(shroud_radius, obj_shroud.clear_grid_size, SHROUD_ALWAYS_VISIBLE);
no_see_tilemaps = obj_player.no_see_tilemaps;

shroud_clear_position(x, y, no_see_tilemaps, current_shroud_mask);

instance_destroy();