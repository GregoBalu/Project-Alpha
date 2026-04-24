if (object_exists(obj_playersheet)) {
    depth = obj_playersheet.depth -1;
}

global.do_pause = true;

init_localisation();
title = getText("Talent_picker_title");
talent_power_label = getText("Talent_power_label");

talent1 = noone;
talent2 = noone;
talent3 = noone;

no_talent_chance = 0.1; //10%
delay_talent_chance = 0.3; //30%

clickable = false;
do_die = false;

reroll_cost = 2;
can_reroll = function() {
    //return obj_player.coins >= reroll_cost;
    return clickable && obj_player.corruption < obj_player.corruption_total;
}

has_delay = false;
force_delay_cost = 5;
can_force_delay = function() {
    //return obj_player.coins >= force_delay_cost;
    return clickable && obj_player.corruption < obj_player.corruption_total;
}

randomize();

var _all_unlocked = true;
for (var _i = 0; _i < ds_list_size(obj_player.talents); ++_i) {
    if (!obj_player.talents[|_i].stackable && !obj_player.talents[|_i].unlocked) {
        _all_unlocked = false;
        break;
    } else if (obj_player.talents[|_i].stackable && obj_player.talents[|_i].current_stack < obj_player.talents[|_i].max_stacks) {
        _all_unlocked = false;
        break;
    }
}

if (_all_unlocked) {
    show_debug_message($"Everything unlocked");
    instance_destroy();
    exit;
}

get_random_talent = function(_ignore1=-1, _ignore2=-1) {
    if (random_range(0, 1) < no_talent_chance) {
        //show_debug_message($"No talent early");
        return -1;
    }
    //show_debug_message($"get_random_talent({_ignore1},{_ignore2})");
    var _r = round(random_range(0, ds_list_size(obj_player.talents)-1));
    //show_debug_message($"_r={_r}");
    for (var _i = _r; _i < ds_list_size(obj_player.talents); ++_i) {
        if (_i == _ignore1) continue;
        if (_i == _ignore2) continue;
        if (!obj_player.talents[|_i].stackable && obj_player.talents[|_i].unlocked) continue;
        if (obj_player.talents[|_i].stackable && obj_player.talents[|_i].current_stack >= obj_player.talents[|_i].max_stacks) continue;
        if (obj_player.talents[|_i].cost_amount > obj_player.talent_points) continue;
            
        //show_debug_message($"Returning {_i}");
        return _i;
    }
    //show_debug_message($"Second loop");
    for (var _i = 0; _i < _r; ++_i) {
        if (_i == _ignore1) continue;
        if (_i == _ignore2) continue;
        if (!obj_player.talents[|_i].stackable && obj_player.talents[|_i].unlocked) continue;
        if (obj_player.talents[|_i].stackable && obj_player.talents[|_i].current_stack >= obj_player.talents[|_i].max_stacks) continue;
        if (obj_player.talents[|_i].cost_amount > obj_player.talent_points) continue;
            
        //show_debug_message($"Returning {_i}");
        return _i;
    }
    //show_debug_message($"No talent");
    return -1;
}

reroll = function(_is_free) {
    if (!_is_free) {
        //obj_player.coins -= reroll_cost;
        obj_player.add_corruption(reroll_cost);
    }
    
    var _i1 = get_random_talent();
    talent1 = (_i1==-1?noone:obj_player.talents[|_i1]);
    var _i2 = -1;
    if (random_range(0, 1) < delay_talent_chance) {
        talent2 = instance_create_layer(0, 0, "GUI", obj_talent_wait_pick);
        has_delay = true;
    } else {
        _i2 = get_random_talent(_i1);
        talent2 = (_i2==-1?noone:obj_player.talents[|_i2]);
        has_delay = false;
    }
    var _i3 = get_random_talent(_i1, _i2);
    talent3 = (_i3==-1?noone:obj_player.talents[|_i3]);
    
    if (talent1 == noone && talent2 == noone && talent3 == noone) {
        show_debug_message("No talents generated");
        talent2 = instance_create_layer(0, 0, "GUI", obj_talent_wait_pick);
    }
}

force_delay = function() {
    //obj_player.coins -= force_delay_cost;
    obj_player.add_corruption(force_delay_cost);
    
    var _inst = instance_create_layer(0, 0, "GUI", obj_talent_wait_pick);
    _inst.action();
    instance_destroy(_inst);
    do_die = true;
    return;
}

dice_rolls = 5;
dice_roll_delay = 10;
reroll(true);
alarm[0] = dice_roll_delay;

//TODO: sound


