// Inherit the parent event
event_inherited();

onPickup = function(othr) {
    data = {
        targetObject : othr,
        speed_boost : speed_boost,
        duration_seconds : speed_decay_seconds
    };
    buff = instance_create_layer(x,y, layer_get_id("Instances"), obj_buff_speed, data);
    return true;
}