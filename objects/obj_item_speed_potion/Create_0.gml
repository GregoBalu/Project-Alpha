// Inherit the parent event
event_inherited();

resize_to(Loot_Size);

_pickupText = $"+{getText("Speed_potion_pickup")} ({speed_boost})"
_pickupColor = c_aqua;

onPickup = function(othr) {
    data = {
        targetObject : othr,
        speed_boost : speed_boost,
        duration_seconds : speed_decay_seconds
    };
    buff = instance_create_layer(x,y, layer_get_id("Instances"), obj_buff_speed, data);
    return true;
}