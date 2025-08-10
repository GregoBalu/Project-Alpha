function initCamera() {
    
}

/**
 * Function Description
 * @param {Vec2} _pos The position of the camera to look at.
 * @param {Real} _dur Duration in seconds to hold keyframe for
 */
function Camera_KeyFrame(_pos, _dur) constructor {
    
    position = _pos;
    duration = _dur;
    
}

function Camera_Transition_Base(_dur) constructor {
    duration = _dur;
    progress = 0;
    
    
    start_point = pointer_null;
    end_point = pointer_null;
    
    is_first = true;
    
    tr_start_base = function(_from, _to, _cam) {
        start_point = _from;
        end_point = _to;
        _cam.follow_player = false;
        is_first = true;
    }
    tr_start = function(_from, _to, _cam) { tr_start_base(_from, _to, _cam); }
    tr_step_base = function(_cam) {
        if (is_first) {
            is_first = false;
            progress += (1/duration);
            return 1;
        }
        var _dt = delta_time / game_get_speed(gamespeed_microseconds);
        progress += (_dt/duration);
        return _dt;
    }
    tr_step = function(_cam) { tr_step_base(_cam); }
    tr_end_base = function(_cam) {}
    tr_end = function(_cam) { tr_end_base(_cam); }
    
    is_finished = function() {
        return progress >= 1;
    }
}

function Camera_Transition_Linear(_dur) : Camera_Transition_Base(_dur) constructor {
    
    step_len = 0;
    step_dir = 0;
    
    current_point = pointer_null;
    
    tr_start = function(_from, _to, _cam) {
        tr_start_base(_from, _to, _cam);
        
        var _totallen = point_distance(start_point.x, start_point.y, end_point.x, end_point.y);
        step_len = _totallen / duration; //length per frame
        step_dir = point_direction(start_point.x, start_point.y, end_point.x, end_point.y);
        current_point = start_point;
        
        _cam.follow_point = current_point;
    }
    tr_step = function(_cam) { 
        var _dt = tr_step_base(_cam);
        current_point = current_point.add(new Vec2(lengthdir_x(step_len*_dt, step_dir), lengthdir_y(step_len*_dt, step_dir) ) );
        _cam.follow_point = current_point;
    }
    tr_end = function(_cam) {
        tr_end_base(_cam);
        _cam.follow_point = end_point;
    }
}

function Camera_Transition_Sin(_dur) : Camera_Transition_Base(_dur) constructor {
    
    total_len = 0;
    step_dir = 0;
    pihalf = pi/2;
    
    current_point = pointer_null;
    
    tr_start = function(_from, _to, _cam) {
        tr_start_base(_from, _to, _cam);
        
        total_len = start_point.distance(end_point); // point_distance(start_point.x, start_point.y, end_point.x, end_point.y);
        step_dir = start_point.direction(end_point); //point_direction(start_point.x, start_point.y, end_point.x, end_point.y);
        
        _cam.follow_point = start_point;
        show_debug_message($"--Start progress={progress} -> {start_point}  totallen={total_len}");
    }
    tr_step = function(_cam) { 
        var _dt = tr_step_base(_cam);
        var _sp = (sin(progress*pi -pihalf)+1)/2;
        
        current_point = start_point.add(new Vec2(lengthdir_x(_sp*total_len, step_dir), lengthdir_y(_sp*total_len, step_dir) ) );
        _cam.follow_point = current_point;
        show_debug_message($"transition progress={progress} -> {current_point}  mysin({progress*pi})={_sp}");
    }
    tr_end = function(_cam) {
        tr_end_base(_cam);
        _cam.follow_point = end_point;
        show_debug_message($"--End progress={progress} -> {end_point}");
    }
}

function Camera_Transition_Instant() : Camera_Transition_Base(0.01) constructor {
    
    tr_step = function(_cam) { 
        var _dt = tr_step_base(_cam);
        _cam.follow_point = end_point;
    }
}

function Camera_Cutscene(_from, _to) constructor {
    
    fadein = true;//TODO
    fadeout = false;//TODO
    
    current_index = 0;
    length = 0;
    is_keyframe = true;
    current_duration = 0;
    is_end = false;
    
    timeframe = [ new Camera_KeyFrame(_from, 0.5*TIME_SECOND), new Camera_KeyFrame(_to, 1*TIME_SECOND), new Camera_KeyFrame(_from, 0.5*TIME_SECOND)];
    transitions = [ new Camera_Transition_Sin(1*TIME_SECOND), new Camera_Transition_Instant() ];
    
    startc = function() {
        current_index = 0;
        is_keyframe = true;
        current_duration = 0;
        
        length = array_length(timeframe);
        obj_camera.follow_player = false;
        obj_player.immobilized = true;
    }
    stepc = function() {
        if (is_end) return;
        
        if (is_keyframe) {
            var _dt = delta_time / game_get_speed(gamespeed_microseconds);
            current_duration += _dt;
            if (current_duration >= timeframe[current_index].duration) {
                if (current_index == length-1) {
                    onEnd();
                }
                is_keyframe = false;
                current_duration = 0;
            } else {
                return;
            }
        } else {
            if (current_duration == 0) {
                transitions[current_index].tr_start(timeframe[current_index].position, timeframe[current_index+1].position, obj_camera);
                ++current_duration;
            }
            transitions[current_index].tr_step(obj_camera);
            if (transitions[current_index].is_finished()) {
                transitions[current_index].tr_end(obj_camera);
                current_duration = 0;
                ++current_index;
                is_keyframe = true;
            }
        }
    }
    
    onEnd = function() {
        is_end = true;
        obj_camera.follow_player = true;
        obj_player.immobilized = false;
    }
    
    is_finished = function() {
        return is_end;
    }
    
    
    
}


