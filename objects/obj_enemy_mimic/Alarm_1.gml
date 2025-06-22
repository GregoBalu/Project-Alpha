if (isSleeping) exit;

image_index++;
if (image_index >= max_spr_num) image_index = 1;
    
alarm[1] = animation_delay_seconds*TIME_SECOND;