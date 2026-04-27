time_start = 0.0;
visible = false;

doJiggle = true;

fade_out = function() {
    if (!visible) return;
        
    alarm[1] = 5;
}

show = function() {
    visible = true;
    alarm[1] = 0;
}
hide = function() {
    visible = false;
    alarm[1] = 0;
}
