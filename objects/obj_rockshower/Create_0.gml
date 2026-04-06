// Inherit the parent event
event_inherited();

damage_cooldown = 0;

original_image_speed = image_speed;

checkPlayerTooFar = function() {}

round_time_ticks = image_number/ image_speed;


enable_for = function(_rounds) {
    show_debug_message($"Enabling rockshower for {id}");
    visible = true;
    image_index = 0;
    image_speed = original_image_speed;
    
    alarm[1] = round(_rounds) * round_time_ticks;
}
disable = function() {
    show_debug_message($"Disable rockshower for {id}");
    image_index = 0;
    image_speed = 0;
    visible = false;
}

if (is_target_for_manager) {
    disable();
}
