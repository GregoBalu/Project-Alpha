if (!firstRoomEnter) exit;
    
firstRoomEnter = false;

log_stat($"obj_player [Room Start] {room}");

default_shroud_mask = shroud_clear_grid_setup(shroud_radius, obj_shroud.clear_grid_size);
current_shroud_mask = default_shroud_mask;

shroud_clear_position(x, y, no_see_tilemaps, default_shroud_mask);

ds_map_add(blocking_shroud_mask_map, Orientation.RIGHT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.RIGHT));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWNRIGHT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.DOWNRIGHT));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWN, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.DOWN));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWNLEFT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.DOWNLEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.LEFT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.LEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.UPLEFT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.UPLEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.UP, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.UP));
ds_map_add(blocking_shroud_mask_map, Orientation.UPRIGHT, shroud_clear_grid_setup_blocked(shroud_radius, obj_shroud.clear_grid_size, Orientation.UPRIGHT));

if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    show_debug_message("Cloning player from room_switcher");
    clone_from(_inst.player_data);
    
    xp = _inst.player_data.xp;
    xp_total = _inst.player_data.xp_total;
    corruption = _inst.player_data.corruption;
    corruption_total = _inst.player_data.corruption_total;
    luck = _inst.player_data.luck;
    talent_points = _inst.player_data.talent_points;
    unlocked_talents = _inst.player_data.unlocked_talents;
    inventory = _inst.player_data.inventory;
    equipped_items = _inst.player_data.equipped_items;
    coins = _inst.player_data.coins;
}