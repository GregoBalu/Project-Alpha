// Inherit the parent event
event_inherited();

stage = 0;
//max_stage = 3;
max_image = 3;
stage_to_img_scale = max_image / max_stage;

show_used = false;


fill = function() {
    if (stage == max_stage) return false;
    
    stage++;
    image_index = clamp(image_index+stage_to_img_scale, 0, max_image);
    return true;
}

burnFuel = function() {
    if (stage == 0) return false;
        
    stage--;
    image_index = clamp(image_index-stage_to_img_scale, 0, max_image);
    
    if (stage == 0) {
        logic_trigger.Off(id);
    }
    
    return true;
}

use = function() {
    //TODO: audio
    logic_trigger.On(id);
}
