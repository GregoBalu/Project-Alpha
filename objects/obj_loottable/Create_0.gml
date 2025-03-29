

itemsLayer = layer_get_id("Items");


generate_loot = function(obj) {
    
    var _max_roll = 100 + obj.level;
    
    var rand = random_range(obj_player.luck, _max_roll);
    show_debug_message("Loot rand: {0} ({1}-{2})", rand, 0, _max_roll);
    if (rand < 50) {
        return;
    } else if (rand < 70) {
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
    } else if (rand < 82) {
        //item?
    }
}