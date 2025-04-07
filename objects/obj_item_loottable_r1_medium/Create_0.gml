// Inherit the parent event
event_inherited();

table = new RDTable();
table.add_entry(20, new CoinDrop(3));
table.add_entry(10, new ItemDrop(obj_ingredient_root, {}, false, true));
table.add_entry(10, new ItemDrop(obj_item_health_potion, {}, false, true));
table.add_entry(10, new ItemDrop(obj_item_pickup_inventory_base, {
    inventory_item: obj_ring_of_erityc
}, true, true));
table.add_entry(10, new ItemDrop(obj_item_pickup_inventory_base, {
    inventory_item: obj_sword_of_misery
}, true, true));
table.add_entry(50, new CoinDrop(1));

function generate_loot(_x, _y, _layer) {
    
    show_debug_message("generate_loot()");
        
    var _res = table.roll(1);
    
    for (var _i = 0; _i < array_length(_res); _i++) {
        _res[_i].create_instance(_x, _y, _layer);
    }
    
}
