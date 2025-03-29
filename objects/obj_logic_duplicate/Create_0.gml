visible = false;


On = function(_inst_id) {
    for (var _i = 0; _i < array_length(activate_inst_array); _i++)
    {
        if (instance_exists(activate_inst_array[_i])) {
            activate_inst_array[_i].On(_inst_id);
        }
    }
};

Off = function(_inst_id) {
    for (var _i = 0; _i < array_length(activate_inst_array); _i++)
    {
        if (instance_exists(activate_inst_array[_i])) {
            activate_inst_array[_i].Off(_inst_id);
        }
    }
};

