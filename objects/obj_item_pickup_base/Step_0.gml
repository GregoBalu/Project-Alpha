_background_sprite_time++;

if (despawn_seconds > 0) {
    if (alarm[DESPAWN_ALARM] <= despawn_threshold2) {
        back_glow_color = c_red;
        _background_sprite_refresh_rate = TIME_SECOND/_background_sprite_fps2;
    } else  if (alarm[DESPAWN_ALARM] <= despawn_threshold1) {
        back_glow_color = c_yellow;
        _background_sprite_refresh_rate = TIME_SECOND/_background_sprite_fps1;
    }
}

