
buffs = ds_list_create();

x = 8;
y = 8;

image_alpha = .2;
image_index = 0;
visible = false;

padding = 4;
width = 32 + 2*padding;
height = 32 + 2*padding;

function addBuff(_inst) {
    //show_debug_message("Adding buff");
    
    for (var _i = 0; _i < ds_list_size(buffs); ++_i)
    {
        if (buffs[|_i].object_index == _inst.object_index) {
            if (buffs[|_i].unique == "Unique") {
                buffs[|_i].setDuration(_inst.duration_seconds);
                return false;
            } else if (buffs[|_i].unique == "Stackable") {
                buffs[|_i].setDuration(_inst.duration_seconds);
                buffs[|_i].addStack(1);
                return false;
            } else {
                break;
            }
        }
    }
    
    ds_list_add(buffs, _inst);
    _inst.depth = depth + 1;
    _inst.visible = visible;
    return true;
}

function removeBuff(_inst) {
    //show_debug_message("Removing buff");
    var _pos = ds_list_find_index(buffs, _inst);
    if (_pos == -1) return;
    ds_list_delete(buffs, _pos);
}

