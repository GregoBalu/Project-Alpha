

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
    
    audio_group_set_gain(ag_music, _json.music_volume);
    audio_group_set_gain(ag_sfx, _json.sfx_volume);
    if (global.language != _json.language) {
        loadLocale(_json.language);
    }
    global.show_hints = _json.show_hints;
    
    with(obj_slider_audio) {
        init();
    }
    with (obj_lang_dropdown) {
        init();
    }
    with (obj_checkbox_show_hint) {
        init();
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
        show_hints: global.show_hints
    };
    
    file_text_write_string(_file, json_stringify(_settings));
    file_text_writeln(_file);
    file_text_close(_file);
}
