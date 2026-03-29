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
    if (debug_mode) show_debug_message($"Loading localisation for: {_lang}");
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
        if (debug_mode) show_debug_message("lang ({0}) not found, defaulting to en", _lang);
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
        //if (debug_mode) show_debug_message($"{file_grid[# 0, _i]} , {file_grid[# 1, _i]}")
        global.localisation[? file_grid[# 0, _i]] = file_grid[# _langCol, _i];
        ++_count;
    }
    if (debug_mode) show_debug_message($"Loaded {_count} localisation lines into map of size={ds_map_size(global.localisation)}");
}

function getText(_code) {
    if (global.localisation == undefined) loadLocale(global.language);
    if (ds_map_exists(global.localisation, _code)) {
        var _text = global.localisation[? _code];
        if (string_length(_text) == 0) {
            if (debug_mode) show_debug_message("!!!! Empty localisation({1}) for : {0}", _code, global.language);
            return "[Unknown: " + global.language + "/" + _code + "]";
        }
        return _text;
    }
    if (debug_mode) show_debug_message("!!!! Did not find localisation({1}) for : {0}", _code, global.language);
    return "[Unknown: " + _code + "]";
}
