// Inherit the parent event
event_inherited();

function generate_loot(_x, _y, _layer) {
    
    var _rand = random_range(0, 100);
    show_debug_message($"Loottable random: {_rand}");
    
    if (_rand < 20) {
        var inst = instance_create_layer(_x, _y, _layer, obj_item_coin);
        inst.depth = depth - 1;
        inst.coin_amount = 3;
    } else if (_rand < 30) {
        var inst = instance_create_layer(_x, _y, _layer, obj_ingredient_root);
        inst.depth = depth - 1;
    } else if (_rand < 40) {
        var inst = instance_create_layer(_x, _y, _layer, obj_item_health_potion);
        inst.depth = depth - 1;
    } else if (_rand < 55) {
        var inst = instance_create_layer(_x, _y, _layer, obj_item_pickup_inventory_base, {
            inventory_item: obj_helm_of_horns
        });
        inst.depth = depth - 1;
    } else {
        var inst = instance_create_layer(_x, _y, _layer, obj_item_coin);
        inst.depth = depth - 1;
    }
    
}