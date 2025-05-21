if (!is_on) exit;

if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true)) {
    
    if (!prev_frame_collision) {
        prev_frame_collision = true;
        cd_to_teleport = 0;
    }
    
    ++cd_to_teleport;
    if (cd_to_teleport >= teleport_at_frames) {
        obj_player.x = target_x;
        obj_player.y = target_y;
        prev_frame_collision = false;
        cd_to_teleport = 0;
        
    } else {
        
        var _dir = point_direction(obj_player.x, obj_player.y, x, y);
        var _len = point_distance(obj_player.x, obj_player.y, x, y);
        
        show_debug_message($"len={_len} dir={_dir}");
        
        var _dx = 0;
        var _dy = 0;
        /*if (_len < 1) {
            _dx = lengthdir_x(_len, _dir);
            _dy = lengthdir_y(_len, _dir);
        } else */{
            
            var _inMagnify = 1;
            if (_len < 16) {
                _inMagnify = 1+ (16-_len)/10;
            }
            
            var _inLen = 0.1 * _inMagnify;
            var _inVec = new Vec2(lengthdir_x(_inLen, _dir), lengthdir_y(_inLen, _dir));
            
            var _latLen = 0.5;
            var _latVec = new Vec2(lengthdir_x(_latLen, (_dir+90) mod 360),  lengthdir_y(_latLen, (_dir+90) mod 360));
            
            var _final = _inVec.add(_latVec);
            _dx = _final.x;
            _dy = _final.y
        }
        
        with(obj_player) {
            move_and_collide(_dx, _dy, collision_array, undefined, undefined, undefined);
        }
    }
} else {
    prev_frame_collision = false;
}