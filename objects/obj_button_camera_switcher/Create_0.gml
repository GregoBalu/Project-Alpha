event_inherited();
text = texts[text_state];

function clicked() {
    var temp = view_camera[camera_from];
    view_camera[camera_from] = view_camera[camera_to];
    view_camera[camera_to] = temp;
    
    //text_state = (text_state+1) mod 2;
    //text = texts[text_state];
}

