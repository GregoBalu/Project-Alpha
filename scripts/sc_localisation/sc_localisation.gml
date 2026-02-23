global.language = "en";
global.localisation = undefined;

function init_localisation(){
    if (!variable_global_exists("localisation")) {
        global.localisation = undefined;
    }
    
    if (global.localisation == undefined) {
        loadLocale("en");
    }
    
}

function loadLocale(_lang) {
    show_debug_message($"Loading localisation for: {_lang}");
    file_grid = load_csv("local.csv");
    var ww = ds_grid_width(file_grid);
    var hh = ds_grid_height(file_grid);
    
    var _langCol = ww;
    for (var _i = 1; _i < ww; ++_i)
    {
        if (_lang == file_grid[# _i, 0]) {
            _langCol = _i;
            break;
        }
    }
    
    global.language = _lang;
    
    if (ww <= _langCol) {
        show_debug_message("lang ({0}) not found, defaulting to en", _lang);
        _langCol = 1;
        global.language = "en";
    }
    
    if (global.localisation != undefined) {
        ds_map_destroy(global.localisation);
    }
    
    global.localisation = ds_map_create();
    var _count = 0;
    for (var _i = 1; _i < hh; ++_i)
    {
        //show_debug_message($"{file_grid[# 0, _i]} , {file_grid[# 1, _i]}")
        global.localisation[? file_grid[# 0, _i]] = file_grid[# _langCol, _i];
        ++_count;
    }
    show_debug_message($"Loaded {_count} localisation lines into map of size={ds_map_size(global.localisation)}");
}


function getText(_code) {
    if (ds_map_exists(global.localisation, _code)) {
        return global.localisation[? _code];
    }
    show_debug_message("!!!! Did not find localisation({1}) for : {0}", _code, global.language);
    return "[Unknown: " + _code + "]";
}
