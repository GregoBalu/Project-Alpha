

itemsLayer = layer_get_id("Items");

loottable = new RDTable();
loottable.add_entry(50, new RDNull());
loottable.add_entry(20, new ItemDrop(obj_ingredient_root, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_ingredient_gregseed, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_item_health_potion, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_item_resto_potion, {}, false, true));
loottable.add_entry(1, new ItemDrop(obj_item_resto_potion, {
            speed_boost : 5,
            speed_decay_seconds : 5
        }, false, true));
loottable.add_entry(10, new CoinDrop(1));
loottable.add_entry(5, new CoinDrop(3));


generate_loot = function(obj) {
    show_debug_message("generate_loot()");
    
    loottable.reset();
    var _res = loottable.roll(1);
    
    for (var _i = 0; _i < array_length(_res); _i++) {
        _res[_i].create_instance(obj.loot_point_offset[0]+random_range(obj.x-2,obj.x+2), obj.loot_point_offset[1]+random_range(obj.y-2,obj.y+2), itemsLayer);
    }
    
    /*var _max_roll = 100 + obj.level;
    
    var rand = random_range(obj_player.luck, _max_roll);
    show_debug_message("Loot rand: {0} ({1}-{2})", rand, 0, _max_roll);
    if (rand < 50) {
        return;
    } else if (rand < 70) {
        show_debug_message("Spawn Ingredient root");
        instance_create_layer(random_range(obj.x-2,obj.x+2), random_range(obj.y-2,obj.y+2), itemsLayer, obj_ingredient_root);
    } else if (rand < 75) {
        show_debug_message("Spawn Health potion");
        instance_create_layer(random_range(obj.x-2,obj.x+2), random_range(obj.y-2,obj.y+2), itemsLayer, obj_item_health_potion);
    } else if (rand < 80) {
        show_debug_message("Spawn Resto potion");
        instance_create_layer(random_range(obj.x-2,obj.x+2), random_range(obj.y-2,obj.y+2), itemsLayer, obj_item_resto_potion);
    } else if (rand < 81) {
        show_debug_message("Spawn Resto potion boosted");
        data = {
            speed_boost : 5,
            speed_decay_seconds : 5
        };
        instance_create_layer(random_range(obj.x-2,obj.x+2), random_range(obj.y-2,obj.y+2), itemsLayer, obj_item_speed_potion, data);
    } else if (rand < 85) {
        //item?
        
        
        
        
        
    } else if (rand < 95) {
        var inst = instance_create_layer(random_range(obj.x-2,obj.x+2), random_range(obj.y-2,obj.y+2), itemsLayer, obj_item_coin);
        inst.depth = depth - 1;
    } else{
        var inst = instance_create_layer(random_range(obj.x-2,obj.x+2), random_range(obj.y-2,obj.y+2), itemsLayer, obj_item_coin);
        inst.depth = depth - 1;
        inst.coin_amount = 3;
    }*/
}