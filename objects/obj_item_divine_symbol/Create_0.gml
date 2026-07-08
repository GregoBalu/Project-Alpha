// Inherit the parent event
event_inherited();

if (!variable_global_exists("divine_items") || global.divine_items == undefined) {
    global.divine_items = array_create(10, false);
}

if ( (room == rm_dungeon && global.divine_items[0]) ||
    (room == rm_cave && global.divine_items[1]) ||
    (room == rm_sewer && global.divine_items[2]) ||
    (room == rm_castle && global.divine_items[3]) ) {
    instance_destroy();
    return;
}

_pickupText = $"+{getText("Divine_symbol_pickup")}"
_pickupColor = c_aqua;

onPickup = function(othr) {
    
    if (room == rm_dungeon) {
        global.divine_items[0] = true;
    } else if (room == rm_cave) {
        global.divine_items[1] = true;
    } else if (room == rm_sewer) {
        global.divine_items[2] = true;
    } else if (room == rm_castle) {
        global.divine_items[3] = true;
    }
    
    
    obj_perma_progress.divine_symbols++;
    return true;
}
