visible = false;


triggerList = ds_list_create();
order_size = array_length(order_insts);

if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}


On = function(_inst_id) {
    
    var _pos = ds_list_find_index(triggerList, _inst_id);
    if (_pos == -1) {
        ds_list_add(triggerList, _inst_id);
    }
    
    if (ds_list_size(triggerList) == order_size) {
        for (var _i = 0; _i < order_size; _i++)
        {
            if (triggerList[|_i] != order_insts[_i]) {
                if (!no_off) {
                    if (instance_exists(activate_inst)) {
                        activate_inst.Off(id);
                    }
                }
                return;
            }
        }
        
        if (instance_exists(activate_inst)) {
            activate_inst.On(id);
        }
    }
    
    if (!no_off) {
        if (instance_exists(activate_inst)) {
            activate_inst.Off(id);
        }
    }
};

Off = function(_inst_id) {
    var _pos = ds_list_find_index(triggerList, _inst_id);
    if (_pos >= 0) {
        ds_list_delete(triggerList, _pos);
    }
    
    if (!no_off) {
        if (instance_exists(activate_inst)) {
            activate_inst.Off(id);
        }
    }
};
