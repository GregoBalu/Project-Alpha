if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    
    ds_list_copy(talents, _inst.sheet.talents);
} else {
    
    ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_heavy_cheap, {
        visible : false,
        depth : depth+10
    }));
    ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_def_hp, {
        visible : false,
        depth : depth+10
    }));
    ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_hp_dmg, {
        visible : false,
        depth : depth+10
    }));
    ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_light_crit, {
        visible : false,
        depth : depth+10
    }));
    ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_interrupt_armor_breaker, {
        visible : false,
        depth : depth+10
    }));
    ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_wait_lifesteal, {
        visible : false,
        depth : depth+10
    }));
}