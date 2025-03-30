// Inherit the parent event
event_inherited();

target_width = 16;
target_height = 16;

sprite_index = object_get_sprite(inventory_item);
image_xscale = target_width / sprite_width;
image_yscale = target_height / sprite_height;

onPickup = function(othr) {
    return obj_player.addToInventory(inventory_item, inventory_slot);
    
}