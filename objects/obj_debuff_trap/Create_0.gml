event_inherited();

debuffedTargets = ds_list_create();

function applyEffect(_buff_obj, _buff_data) {
    var buff = instance_create_layer(x,y, layer_get_id("Instances"), _buff_obj, _buff_data);
    ds_list_add(debuffedTargets, {
        effect : buff
    });
}

getBuffData = function(_othr) {};

onPlayerCollide = function() {
    for (var _i = 0; _i < ds_list_size(debuffedTargets); _i++)
    {
        if ( instance_exists(debuffedTargets[|_i].effect) && 
                debuffedTargets[|_i].effect.targetObject == obj_player) {
            return;
        }
    }

    var _buff_data = getBuffData(obj_player);
    applyEffect(_buff_data.obj, _buff_data.data);
}


alarm[0] = (start_delay_seconds + 1) * TIME_SECOND;