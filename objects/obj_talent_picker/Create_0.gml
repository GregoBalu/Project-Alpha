

global.do_pause = true;

function get_random_talent(_ignore1=-1, _ignore2=-1) {
    show_debug_message($"get_random_talent({_ignore1},{_ignore2})");
    var _r = round(random_range(0, ds_list_size(obj_player.talents)-1));
    show_debug_message($"_r={_r}");
    for (var _i = _r; _i < ds_list_size(obj_player.talents); ++_i) {
        if (_i == _ignore1) continue;
        if (_i == _ignore2) continue;
        if (!obj_player.talents[|_i].stackable && obj_player.talents[|_i].unlocked) continue;
        if (obj_player.talents[|_i].stackable && obj_player.talents[|_i].current_stack >= obj_player.talents[|_i].max_stacks) continue;
        if (obj_player.talents[|_i].cost_amount > obj_player.talent_points) continue;
            
        show_debug_message($"Returning {_i}");
        return _i;
    }
    show_debug_message($"Second loop");
    for (var _i = 0; _i < _r; ++_i) {
        if (_i == _ignore1) continue;
        if (_i == _ignore2) continue;
        if (!obj_player.talents[|_i].stackable && obj_player.talents[|_i].unlocked) continue;
        if (obj_player.talents[|_i].stackable && obj_player.talents[|_i].current_stack >= obj_player.talents[|_i].max_stacks) continue;
        if (obj_player.talents[|_i].cost_amount > obj_player.talent_points) continue;
            
        show_debug_message($"Returning {_i}");
        return _i;
    }
    show_debug_message($"No talent");
    return -1;
}

var _i1 = get_random_talent();
talent1 = (_i1==-1?noone:obj_player.talents[|_i1]);
var _i2 = get_random_talent(_i1);
if (random_range(0, 10) < 3) {
    talent2 = instance_create_layer(0, 0, "GUI", obj_talent_wait_pick);
} else {
    talent2 = (_i2==-1?noone:obj_player.talents[|_i2]);
}
var _i3 = get_random_talent(_i1, _i2);
talent3 = (_i3==-1?noone:obj_player.talents[|_i3]);

if (talent1 == noone && talent2 == noone && talent3 == noone) {
    instance_destroy();
    exit;
}



/*if (talent1 == noone) {
    talent1 = instance_create_layer(0, 0, "GUI", obj_talent_dummy);
}
if (talent2 == noone) {
    talent2 = instance_create_layer(0, 0, "GUI", obj_talent_dummy);
}
if (talent3 == noone) {
    talent3 = instance_create_layer(0, 0, "GUI", obj_talent_dummy);
}*/
