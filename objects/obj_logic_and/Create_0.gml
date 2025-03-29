visible = false;


andList = ds_list_create();

if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}


On = function(_inst_id) {
    
    var _pos = ds_list_find_index(andList, _inst_id);
    if (_pos == -1) {
        ds_list_add(andList, _inst_id);
    }
    
    if (ds_list_size(andList) >= number_of_ands) {
        if (instance_exists(activate_inst)) {
            activate_inst.On(id);
        }
    }
};

Off = function(_inst_id) {
    var _pos = ds_list_find_index(andList, _inst_id);
    if (_pos >= 0) {
        ds_list_delete(andList, _pos);
    }
    
    if (ds_list_size(andList) == (number_of_ands-1)) {
        if (instance_exists(activate_inst)) {
            activate_inst.Off(id);
        }
    }
};
