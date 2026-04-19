// Inherit the parent event
event_inherited();

damage_cooldown = 0;

image_fps = sprite_get_speed(sprite_index);
original_image_speed = image_speed;

checkPlayerTooFar = function() {}

round_time_ticks = (image_number/ image_fps)*TIME_SECOND;
if (DEBUG) show_debug_message($"round_time_ticks={round_time_ticks}")


enable_for = function(_rounds) {
    if (image_speed > 0) exit;
        
    if (DEBUG) show_debug_message($"Enabling rockshower {id} for {_rounds} rounds");
    visible = true;
    image_index = 0;
    image_speed = original_image_speed;
    is_on = true;
    
    alarm[1] = round(_rounds) * round_time_ticks;
}
disable = function() {
    if (image_speed == 0) exit;
    
    if (DEBUG) show_debug_message($"Disable rockshower {id}");
    image_index = 0;
    image_speed = 0;
    visible = false;
    is_on = false;
}

if (is_target_for_manager) {
    disable();
}
