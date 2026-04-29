event_inherited();

debuffedTargets = ds_list_create();

function applyEffect(_buff_obj, _buff_data) {
    var buff = instance_create_layer(x,y, layer_get_id("Instances"), _buff_obj, _buff_data);
    ds_list_add(debuffedTargets, {
        effect : buff
    });
}

getBuffData = function(_othr) {};

hitboxes = [];
hitboxes_len = 0;

alarm[0] = (start_delay_seconds + 1) * TIME_SECOND;