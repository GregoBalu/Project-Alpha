// Inherit the parent event
event_inherited();

image_speed = 0;

image_index = 0;
max_image_index = 8;

tick = 0;

getBuffData = function(_othr) {
    return {
        obj : obj_buff_poison,
        data : {
            targetObject : _othr,
            duration_seconds : poison_duration_seconds,
            dot_damage : dot_damage,
            dot_tickrate_seconds : dot_tickrate_seconds
        }
    };
}

ds_list_add(no_effect_frames, 0);
ds_list_add(no_effect_frames, 1);