visible = false;


orList = ds_list_create();

if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}


On = function(_inst_id) {
    
    var _pos = ds_list_find_index(orList, _inst_id);
    if (_pos == -1) {
        ds_list_add(orList, _inst_id);
    }
    
    if (ds_list_size(orList) >= 1) {
        if (instance_exists(activate_inst)) {
            activate_inst.On(id);
        }
    }
};

Off = function(_inst_id) {
    var _pos = ds_list_find_index(orList, _inst_id);
    if (_pos >= 0) {
        ds_list_delete(orList, _pos);
    }
    
    if (ds_list_size(orList) == 0) {
        if (instance_exists(activate_inst)) {
            activate_inst.Off(id);
        }
    }
};
