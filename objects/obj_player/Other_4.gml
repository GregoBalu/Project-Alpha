if (instance_exists(obj_fish_switcher)) {
    statistic.fish_caught += obj_fish_switcher.fish_caught;
    statistic.fish_missed += obj_fish_switcher.fish_missed;
}

if (!firstRoomEnter) exit;
    
firstRoomEnter = false;

log_stat($"obj_player [Room Start] {room}");

if (room == rm_castle) {
    shroud_radius_base += 1;
    if (DEBUG) {
        show_debug_message("Increasing shroud radius");
    }
} else if (room == rm_end) {
    immobilized = true;
}

statistic.rooms_started++;

generate_shroud_masks();

if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    if (DEBUG) show_debug_message("Cloning player from room_switcher");
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
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_defend_heal, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_st_lifesteal, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
        ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_st_torch, {
            visible : false,
            depth : depth+10,
            persistent: true
        }));
    }
    
}


