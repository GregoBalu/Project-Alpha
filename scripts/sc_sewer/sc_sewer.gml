
function clear_zapped() {
    if (ds_list_size(zapped) > 0) {
        for (var _i = 0; _i < ds_list_size(zapped); _i++)
        {
            zapped[|_i].toggle_zap(id);
            ds_list_delete(zapped, _i);
            ds_list_delete(paths, _i);
            _i--;
        }
    }
}

function check_zapping(_alarm){
    if (!zapping) {
        clear_zapped();
    } else if (zapping && ds_list_size(zapped) > 0) {
        for (var _i = 0; _i < ds_list_size(zapped); _i++)
        {
            var _path = paths[|_i];
            var _last = path_get_number(_path)-1;
            if (path_get_point_x(_path, _last) != zapped[|_i].x ||
                path_get_point_y(_path, _last) != zapped[|_i].y) {
                path_delete(paths[|_i]);
                paths[|_i] = create_path(zapped[|_i].x, zapped[|_i].y);
            }
        }
    }
    
    if (!zapping || paused) {
        alarm[_alarm] = zap_frequency;
        exit;   
    }
    
    
    for (var _i = 0; _i < ds_list_size(zapped); _i++)
    {
        if (point_distance(zapped[|_i].x, zapped[|_i].y, x, y) >= zap_length) {
            zapped[|_i].toggle_zap(id);
            ds_list_delete(zapped, _i);
            ds_list_delete(paths, _i);
            _i--;
        }
    }
    
    with (obj_lightning_join) {
        if (!zapping && point_distance(x, y, other.x, other.y) < other.zap_length) {
            ds_list_add(other.zapped, id);
            ds_list_add(other.paths, other.create_path(x, y));
            toggle_zap(other.id);
        }
    }
    with (obj_lightning_rod) {
        if (!zapping && point_distance(x, y, other.x, other.y) < other.zap_length) {
            ds_list_add(other.zapped, id);
            ds_list_add(other.paths, other.create_path(x, y));
            toggle_zap(other.id);
        }
    }
    
    
    alarm[_alarm] = zap_frequency;
}