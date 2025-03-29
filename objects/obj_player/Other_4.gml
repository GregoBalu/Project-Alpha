if (!firstRoomEnter) exit;
    
firstRoomEnter = false;

log_stat($"obj_player [Room Start] {room}");

default_shroud_mask = shroud_clear_grid_setup(shroud_radius, obj_shroud.clear_grid_size);
current_shroud_mask = default_shroud_mask;

shroud_clear_position(x, y, light_tilemaps, default_shroud_mask);

ds_map_add(blocking_shroud_mask_map, Orientation.RIGHT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.RIGHT));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWNRIGHT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.DOWNRIGHT));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWN, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.DOWN));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWNLEFT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.DOWNLEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.LEFT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.LEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.UPLEFT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.UPLEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.UP, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.UP));
ds_map_add(blocking_shroud_mask_map, Orientation.UPRIGHT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.UPRIGHT));
