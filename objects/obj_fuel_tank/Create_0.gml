// Inherit the parent event
event_inherited();

stage = 0;
max_stage = 3;

show_used = false;


fill = function() {
    if (stage == max_stage) exit;
    
    stage++;
    image_index++;
    
    
}

use = function() {
    //TODO: audio
    logic_trigger.On(id);
}
