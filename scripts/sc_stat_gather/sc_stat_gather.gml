

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

