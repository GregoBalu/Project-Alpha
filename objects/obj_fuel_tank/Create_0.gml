// Inherit the parent event
event_inherited();

stage = 0;
//max_stage = 3;
max_image = 3;
stage_to_img_scale = max_image / max_stage;

is_on = (stage == max_stage);
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
        is_on = false;
        if (auto_burn) {
            alarm[0] = 0;
        }
    }
    
    return true;
}

use = function() {
    if (!is_on) {
        is_on = true;
        //TODO: audio
        logic_trigger.On(id);
        if (auto_burn) {
            alarm[0] = 5*TIME_SECOND;
        }
    }
}
