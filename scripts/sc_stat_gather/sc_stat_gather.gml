

stats_file = undefined;
do_gather_stat = false;

function open_stats_gather_file(){
    
    /*if (!global.do_gather_stat) {
        exit;
    }
    
    var now = date_current_datetime();
    
    
    
    var _fname = $"stats.{string_format(date_get_year(now),4,0)}{string_format(date_get_month(now),2,0)}{string_format(date_get_day(now),2,0)}_{string_format(date_get_hour(now),2,0)}{string_format(date_get_minute(now),2,0)}{string_format(date_get_second(now),2,0)}.gather";
    show_debug_message($"fname={_fname}");
    return file_text_open_write(_fname);*/
}

function close_stats_gather_file() {
    /*if (!global.do_gather_stat) {
        exit;
    }
    
    show_debug_message($"closing {global.stats_file}")
    file_text_close(global.stats_file);
    global.stats_file = undefined;*/
}


function log_stat(_str) {
    
    show_debug_message(_str);
    
    /*if (!global.do_gather_stat) {
        exit;
    }
    
    if (global.stats_file == undefined) {
        global.stats_file = open_stats_gather_file();
        show_debug_message($"stats_file={global.stats_file}");
    }
    
    var _line = $"{current_time}: {_str}";
    
    file_text_write_string(global.stats_file, _line);
    file_text_writeln(global.stats_file);
    
    */
}

global.highscore = 0;

/**
 * Function Description
 * @param {Real} _time Time point
 * @param {Real} _score Score
 */
function HighscoreItem(_time, _score) constructor {
    time = _time;
    hscore = _score;
    
    
}

function log_highscore(_score) {
    var _file = file_text_open_append("highscore.dat");
    
    var _ct = date_current_datetime();
    var _hi = new HighscoreItem(_ct, _score);
    file_text_write_string(_file, json_stringify(_hi));
    file_text_writeln(_file);
    delete _hi;
    
    file_text_close(_file);
}

function get_highscores() {
    var _file = file_text_open_read("highscore.dat");
    
    
    var _result = ds_list_create();
    if (_file < 0) {
        return _result;
    }
    
    do {
        var _line = file_text_read_string(_file);
        var _json = json_parse(_line);
        
        var _hi = new HighscoreItem(_json.time, _json.hscore);
        if (global.highscore < _hi.hscore) {
            global.highscore = _hi.hscore;
        }
        ds_list_add(_result, _hi);
        
        file_text_readln(_file);
    } until(file_text_eof(_file));
    show_debug_message($"Highscore list size={ds_list_size(_result)}");
    file_text_close(_file);
    return _result;
}

function Statistic() constructor {
    total_xp = 0;
    level_ups = 0;
    talent_gains = 0;
    
    healing_cauldron = 0;
    healing_cauldron_count = 0;
    healing_potion = 0;
    healing_potion_count = 0;
    healing_lifesteal = 0;
    healing_lifesteal_count = 0;
    healing_levelup = 0;
    healing_levelup_count = 0;
    healing_other = 0;
    healing_other_count = 0;
    
    damage_by_spiketrap = 0;
    damage_by_spiketrap_count = 0;
    damage_by_poisontrap = 0;
    damage_by_poisontrap_count = 0;
    damage_by_speartrap = 0;
    damage_by_speartrap_count = 0;
    damage_by_balltrap = 0;
    damage_by_balltrap_count = 0;
    damage_by_tnt = 0;
    damage_by_tnt_count = 0;
    
    damage_by_enemies = 0;
    damage_by_enemies_count = 0;
    enemy_crits = 0;
    
    damage_to_enemies = 0;
    damage_to_enemies_count = 0;
    crits = 0;
    
    distance_walked = 0;
    distance_ran = 0;
    
    corruption_gained = 0;
    corruption_lost = 0;
    
    fish_caught = 0;
    fish_missed = 0;
    
    start_time = date_current_datetime();
}

