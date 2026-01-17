if (instance_exists(obj_fish_switcher)) {
    statistic.fish_caught += obj_fish_switcher.fish_caught;
    statistic.fish_missed += obj_fish_switcher.fish_missed;
}

if (!firstRoomEnter) exit;
    
firstRoomEnter = false;

log_stat($"obj_player [Room Start] {room}");

default_shroud_mask = shroud_clear_grid_setup(shroud_radius(), obj_shroud.clear_grid_size);
current_shroud_mask = default_shroud_mask;

shroud_clear_position(x, y, no_see_tilemaps, default_shroud_mask);

ds_map_add(blocking_shroud_mask_map, Orientation.RIGHT, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.RIGHT));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWNRIGHT, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.DOWNRIGHT));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWN, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.DOWN));
ds_map_add(blocking_shroud_mask_map, Orientation.DOWNLEFT, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.DOWNLEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.LEFT, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.LEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.UPLEFT, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.UPLEFT));
ds_map_add(blocking_shroud_mask_map, Orientation.UP, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.UP));
ds_map_add(blocking_shroud_mask_map, Orientation.UPRIGHT, shroud_clear_grid_setup_blocked(shroud_radius(), obj_shroud.clear_grid_size, Orientation.UPRIGHT));

if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    show_debug_message("Cloning player from room_switcher");
    load_player_data_from(_inst);
    
    create_checkpoint();
} else if (instance_exists(obj_checkpoint)) {
    var _inst = instance_find(obj_checkpoint, 0);
    show_debug_message("Cloning player from checkpoint");
    load_player_data_from(_inst);
} else {
    {
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_heavy_cheap, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_def_hp, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_hp_dmg, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_light_crit, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_interrupt_armor_breaker, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_wait_lifesteal, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_wait_charge, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_light_rng, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_st_life, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_st_crit, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_st_atk_chrg, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_st_util_chrg, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_st_speed, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_wait_more, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_interrupt_damage, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_defend_lengthen, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
    }
    
    create_checkpoint();
}


