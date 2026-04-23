if (!is_on || paused) exit;

if (ds_list_find_index(no_effect_frames, image_index) >= 0) {
    return;
}

for (var _i = 0; _i < ds_list_size(debuffedTargets); _i++)
{
    if ( instance_exists(debuffedTargets[|_i].effect) && 
            debuffedTargets[|_i].effect.targetObject == obj_player) {
        return;
    }
}

var _buff_data = getBuffData(obj_player);
applyEffect(_buff_data.obj, _buff_data.data);