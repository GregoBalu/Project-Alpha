// Inherit the parent event
event_inherited();

onPickup = function(othr) {
    data = {
        targetObject : othr,
        hot_amount : heal_per_tick,
        hot_tickrate_seconds : tick_seconds,
        duration_seconds : duration_seconds
    };
    buff = instance_create_layer(x,y, layer_get_id("Instances"), obj_buff_resto, data);
    return true;
}
