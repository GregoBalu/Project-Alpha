

itemsLayer = layer_get_id("Items");

loottable = new RDTable();
loottable.add_entry(50, new RDNull());
loottable.add_entry(10, new ItemDrop(obj_ingredient_root, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_ingredient_gregseed, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_item_health_potion, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_item_resto_potion, {}, false, true));
loottable.add_entry(1, new ItemDrop(obj_item_resto_potion, {
            speed_boost : 5,
            speed_decay_seconds : 5
        }, false, true));
loottable.add_entry(10, new CoinDrop(1));
loottable.add_entry(5, new CoinDrop(3));
loottable.add_entry(1, new CoinDrop(5));


generate_loot = function(obj) {
    show_debug_message("generate_loot()");
    
    loottable.reset();
    var _res = loottable.roll(1);
    
    for (var _i = 0; _i < array_length(_res); _i++) {
        _res[_i].create_instance(obj.loot_point_offset[0]+random_range(obj.x-2,obj.x+2), obj.loot_point_offset[1]+random_range(obj.y-2,obj.y+2), itemsLayer);
    }
}