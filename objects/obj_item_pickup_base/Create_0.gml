#macro DESPAWN_ALARM 0
#macro PICKUP_ALARM 1

can_pickup = false;

back_glow_color = c_white;
_background_sprite_time = 0;
_background_sprite_fps = 6;
_background_sprite_fps1 = 12;
_background_sprite_fps2 = 18;
_background_sprite_refresh_rate = TIME_SECOND/_background_sprite_fps;

if (despawn_seconds > 0) {
    alarm[DESPAWN_ALARM] = despawn_seconds * TIME_SECOND;
    
    despawn_threshold1 = 0.7*despawn_seconds * TIME_SECOND;
    despawn_threshold2 = 0.3*despawn_seconds * TIME_SECOND;
}
if (despawn_seconds > 0) {
    alarm[PICKUP_ALARM] = pickup_delay_seconds * TIME_SECOND;
} else {
    can_pickup = true;
}


/**
 *  Function Description
 * @param {any*} othr  Instance that picked up
 * @returns {bool} Whether the pickup succeeded or not.
 */
function onPickup(othr) {
    //show_debug_message("Pickup base");
    return false;
}


