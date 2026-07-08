

function menu_show_highscores() {
    var temp = view_camera[0];
    view_camera[0] = view_camera[2];
    view_camera[2] = temp;
}

function onNewGame() {
    
    global.divine_items = undefined;
    
    
}

global.settings_loaded = false;

function loadSettings() {
    if (global.settings_loaded) exit;
    init_localisation();
    
    var _fname = "settings.dat";
    if (!file_exists(_fname)) exit;
    var _file = file_text_open_read(_fname);
    if (_file < 0) {
        show_debug_message($"Cannot open settings file: {_fname}");
        exit;
    }
    
    var _line = file_text_read_string(_file);
    var _json = json_parse(_line);
    
    var _loaded_audio = false;
    
    if (struct_exists(_json, "music_volume")) {
        audio_group_set_gain(ag_music, _json.music_volume);
        _loaded_audio = true;
    }
    if (struct_exists(_json, "sfx_volume")) {
        audio_group_set_gain(ag_sfx, _json.sfx_volume);
        _loaded_audio = true;
    }
    if (struct_exists(_json, "language")) {
        if (global.language != _json.language) {
            loadLocale(_json.language);
            with (obj_lang_dropdown) {
                init();
            }
        }
    }
    if (struct_exists(_json, "show_hints")) {
        global.show_hints = _json.show_hints;
        with (obj_checkbox_show_hint) {
            init();
        }
    }
    if (struct_exists(_json, "progress")) {
        if (struct_exists(_json.progress, "divine_symbols")) {
            obj_perma_progress.divine_symbols = _json.progress.divine_symbols;
        }
    }
    
    if (_loaded_audio) {
        with(obj_slider_audio) {
            init();
        }
    }

    file_text_close(_file);
    global.settings_loaded = true;
}

function saveSettings() {
    var _file = file_text_open_write("settings.dat");
    
    _settings = {
        music_volume: audio_group_get_gain(ag_music),
        sfx_volume: audio_group_get_gain(ag_sfx),
        language: global.language,
        show_hints: global.show_hints,
        progress: {
            divine_symbols: obj_perma_progress.divine_symbols
        }
    };
    
    file_text_write_string(_file, json_stringify(_settings));
    file_text_writeln(_file);
    file_text_close(_file);
}
