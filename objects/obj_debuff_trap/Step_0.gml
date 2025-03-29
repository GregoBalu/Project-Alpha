for (var _i = 0; _i < ds_list_size(debuffedTargets); )
{
    if ( !instance_exists(debuffedTargets[|_i].effect) ) {
        ds_list_delete(debuffedTargets, _i);
        continue;
    }
    _i++;
}