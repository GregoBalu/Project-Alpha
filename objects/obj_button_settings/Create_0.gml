event_inherited();

texts = [ "Settings", "Back" ];
//text_state = 0;
text = texts[text_state];

function clicked() {
    var temp = view_camera[0];
    view_camera[0] = view_camera[1];
    view_camera[1] = temp;
    
    //text_state = (text_state+1) mod 2;
    //text = texts[text_state];
}

