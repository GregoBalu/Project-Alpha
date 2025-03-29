if (only_player && other.id != obj_player.id) {
    return;
}

if (ds_list_find_index(no_effect_frames, image_index) >= 0) {
    return;
}

if (other == undefined)
    return;

for (var _i = 0; _i < ds_list_size(debuffedTargets); _i++)
{
    if ( instance_exists(debuffedTargets[|_i].effect) && 
            debuffedTargets[|_i].effect.targetObject == other) {
        return;
    }
}

var _buff_data = getBuffData(other);
applyEffect(_buff_data.obj, _buff_data.data);