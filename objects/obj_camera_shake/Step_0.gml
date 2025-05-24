
if (shake) 
{ 
    
    if (shake_delay > 0) {
        shake_delay -= 1;
    } else {
        shake_time -= 1; 
        //show_debug_message("Shaking");
        
        var _xval = sin(delta_time)*shake_magnitude;
        var _yval = sin(delta_time)*shake_magnitude;
        if (instance_exists(obj_camera)) {
            obj_camera.offset.x = _xval;
            obj_camera.offset.y = _yval;
        } else {
            _xval = camera_origin.x + _xval;//choose(-shake_magnitude, shake_magnitude); 
            _yval = camera_origin.y + _yval;//choose(-shake_magnitude, shake_magnitude); 
            camera_set_view_pos(cam, _xval, _yval); 
        }
        
        if (shake_time <= 0) 
        { 
            shake_magnitude -= shake_fade; 
        
            if (shake_magnitude <= 0) 
            { 
                if (instance_exists(obj_camera)) {
                    obj_camera.offset.x = obj_camera.offset.y = 0;
                } else {
                    camera_set_view_pos(cam, camera_origin.x, camera_origin.y); 
                }
                shake = false; 
            } 
        }
    }
}
