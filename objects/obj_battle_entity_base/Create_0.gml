
is_stunned = false;


/**
 *  Function to make entity take damage and display said damage.
 * @param {real} _amount  Amount of damage delt.
 * @param {bool} _did_crit If the damage was a crit or not
 * @returns {real} The actual damage the entity took
 */
function take_damage(_amount, _did_crit) {
    if (_amount == 0) {
        return 0;
    }
    
    var _is_dmg = true;
    var _damaged_amount = _amount;
    if (_damaged_amount > 0) {
        _damaged_amount = clamp(_damaged_amount - data.defense, 0, 10*_amount);
    } else {
        //heal
        _is_dmg = false;
        _damaged_amount = clamp(_damaged_amount, 10*_amount, 0);
    }
    
    data.hp = clamp(data.hp - _damaged_amount, 0, data.hp_total);
    if (data.hp < 0.1) {
        data.hp = 0;
    }
    
    var _color = c_white;
    if (_is_dmg) {
        _color = _did_crit?Battle_Text_Roll_Crit:Battle_Text_Roll_Normal;
    } else {
        _color = _did_crit?Battle_Text_Roll_Heal_Crit:Battle_Text_Roll_Heal_Normal;
    }
    
    instance_create_depth(xstart, ystart-10, depth-1, obj_battle_text_roll, {
        text : string("{0}", string_format(-_damaged_amount,1,1)),
        time_seconds : 1.2,
        width : 15,
        heigth : 12,
        color : _color
    });
    return _damaged_amount;
}

buffs = ds_list_create();
function add_buff(_buff) {
    ds_list_add(buffs, _buff);
}

function tick_turn(_is_player_next_turn) {
    for (var _i = 0; _i < ds_list_size(buffs);) {
        buffs[|_i].turn(_is_player_next_turn);
        if (buffs[|_i].remaining_turns == 0) {
            ds_list_delete(buffs, _i);
            continue;
        }
        ++_i;
    }
}

function tick_stop() {
    for (var _i = 0; _i < ds_list_size(buffs);) {
        buffs[|_i].stop();
        if (buffs[|_i].remaining_turns == 0) {
            ds_list_delete(buffs, _i);
            continue;
        }
        ++_i;
    }
}