
if (shake) 
{ 
    if (shake_delay > 0) {
        shake_delay -= 1;
    } else {
        shake_time -= 1; 
        
        var _xval = sin(delta_time)*shake_magnitude;//choose(-shake_magnitude, shake_magnitude); 
        var _yval = sin(delta_time)*shake_magnitude;//choose(-shake_magnitude, shake_magnitude); 
        camera_set_view_pos(cam, _xval, _yval); 
        
        if (shake_time <= 0) 
        { 
            shake_magnitude -= shake_fade; 
        
            if (shake_magnitude <= 0) 
            { 
                camera_set_view_pos(cam, 0, 0); 
                shake = false; 
            } 
        }
    }
}
