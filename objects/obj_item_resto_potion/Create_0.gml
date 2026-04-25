// Inherit the parent event
event_inherited();

resize_to(Loot_Size);

_pickupText = $"+{getText("Restoration_potion_pickup")} ({heal_per_tick})"
_pickupColor = c_red;

onPickup = function(othr) {
    if (othr.hp >= othr.hp_total) return false;
    
    data = {
        targetObject : othr,
        hot_amount : heal_per_tick,
        hot_tickrate_seconds : tick_seconds,
        duration_seconds : duration_seconds
    };
    buff = instance_create_layer(x,y, layer_get_id("Instances"), obj_buff_resto, data);
    return true;
}
