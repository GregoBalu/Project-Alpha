// Inherit the parent event
event_inherited();


resize_to(Loot_Size);

onBrew = function() {

    var buff = instance_create_layer(x,y, layer_get_id("Instances"), obj_buff_resto, {
        targetObject : obj_player,
        hot_amount : 1,
        hot_tickrate_seconds : 0.5,
        duration_seconds : 5
    });
    buff = instance_create_layer(x,y, layer_get_id("Instances"), obj_buff_drunk, {
        targetObject: obj_player,
        duration_seconds: 10
    });
    
}
    
