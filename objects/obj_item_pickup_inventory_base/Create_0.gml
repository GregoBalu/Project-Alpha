// Inherit the parent event
event_inherited();

onPickup = function(othr) {
    return obj_player.addToInventory(inventory_item, inventory_slot);
    
}