// Inherit the parent event
event_inherited();

resize_to(Loot_Size);

onPickup = function(othr) {
    data = {
        targetObject : othr,
        duration_seconds : duration_seconds
    };
    buff = instance_create_layer(x,y, layer_get_id("Instances"), obj_buff_dark, data);
    return true;
}
