function init_localisation(){
    
    if (global.localisation == undefined) {
        loadLocale("en");
    }
    
}

global.language = "en";
global.localisation = undefined;

function loadLocale(_lang) {
    show_debug_message($"Loading localisation for: {_lang}");
    file_grid = load_csv("local.csv");
    var ww = ds_grid_width(file_grid);
    var hh = ds_grid_height(file_grid);
    
    var _langCol = 1;
    if (_lang == "en") {
        _langCol = 1;
    } else if (_lang == "hu") {
        _langCol = 2;
    }
    
    global.language = _lang;
    
    if (ww < _langCol) {
        show_debug_message($"Csv too narrow, defaulting to en");
        _langCol = 1;
        global.language = "en";
    }
    
    if (global.localisation != undefined) {
        ds_map_destroy(global.localisation);
    }
    
    global.localisation = ds_map_create();
    var _count = 0;
    for (var _i = 0; _i < hh; ++_i)
    {
        show_debug_message($"{file_grid[# 0, _i]} , {file_grid[# 1, _i]}")
        global.localisation[? file_grid[# 0, _i]] = file_grid[# _langCol, _i];
        ++_count;
    }
    show_debug_message($"Loaded {_count} localisation lines into map of size={ds_map_size(global.localisation)}");
}


function getText(_code) {
    if (ds_map_exists(global.localisation, _code)) {
        return global.localisation[? _code];
    }
    return "[Unknown: " + _code + "]";
}
