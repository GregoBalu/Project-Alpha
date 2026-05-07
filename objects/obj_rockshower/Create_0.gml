// Inherit the parent event
event_inherited();

damage_cooldown = 0;

image_fps = sprite_get_speed(sprite_index);
original_image_speed = image_speed;

round_time_ticks = (image_number/ image_fps)*TIME_SECOND;
if (DEBUG) show_debug_message($"round_time_ticks={round_time_ticks}")

onPlayerCollide = function() {
    
    if (damage_cooldown > 0) exit;
    if (image_index < 6 || image_index>=15) exit;
        
    obj_player.damage_receive(2);
    obj_player.statistic.damage_by_rockshower += 2;
    obj_player.statistic.damage_by_rockshower_count++;
    
    damage_cooldown = TIME_SECOND;
    alarm[0] = damage_cooldown;
}

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
