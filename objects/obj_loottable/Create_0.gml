

itemsLayer = layer_get_id("Items");

loottable = new RDTable();
loottable.add_entry(45, new RDNull());
loottable.add_entry(10, new ItemDrop(obj_ingredient_root, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_ingredient_gregseed, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_ingredient_slewleaf, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_item_health_potion, {}, false, true));
loottable.add_entry(5, new ItemDrop(obj_item_resto_potion, {}, false, true));
loottable.add_entry(1, new ItemDrop(obj_item_resto_potion, {
            speed_boost : 5,
            speed_decay_seconds : 5
        }, false, true));
loottable.add_entry(10, new CoinDrop(1));
loottable.add_entry(5, new CoinDrop(3));
loottable.add_entry(1, new CoinDrop(5));

collision_array = [ obj_player, obj_collider, layer_tilemap_get_id("Tiles_Col_Invis"), layer_tilemap_get_id("Tiles_Col") ];


search_point = function(target_x, target_y, radius, width, height){
    
    var cx = target_x;
    var cy = target_y;
    
    var tries = 20;
    
    for (var i = 0; i < tries; i++)
    {
        var angle = irandom_range(0, 359);
        var dist = random(radius);
    
        var nx = cx + lengthdir_x(dist, angle);
        var ny = cy + lengthdir_y(dist, angle);
        
        var x1 = nx;
        var y1 = ny;
        var x2 = nx;
        var y2 = ny;
    
        if (collision_rectangle(x1, y1, x2, y2, collision_array, false, true) == noone) 
        {
            if (debug_mode) show_debug_message($"Loot point {target_x},{target_y} -> {nx},{ny}");
            return [nx, ny];
        }
    }
    
    return [ random_range(target_x-2,target_x+2),  random_range(target_y-2,target_y+2)]
}

generate_loot = function(obj) {
    if (debug_mode) show_debug_message("generate_loot()");
    
    loottable.reset();
    var _res = loottable.roll(1);
    
    for (var _i = 0; _i < array_length(_res); _i++) {
        var _p = search_point(obj.x+obj.loot_point_offset[0], obj.y+obj.loot_point_offset[1], 24, Loot_Size, Loot_Size);
        _res[_i].create_instance(_p[0], _p[1], itemsLayer);
    }
}
