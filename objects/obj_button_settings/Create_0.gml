event_inherited();

texts = [ "Settings", "Back" ];
//text_state = 0;
text = getText(texts[text_state]);

onGoToBack = function() {
    saveSettings();
}

onGoToSettings = function() {
    
}

clicked = function() {
    var temp = view_camera[0];
    view_camera[0] = view_camera[1];
    view_camera[1] = temp;
    
    if (text_state == 0) {
        onGoToSettings();
    } else {
        onGoToBack();
    }
    
    //text_state = (text_state+1) mod 2;
    //text = texts[text_state];
}

