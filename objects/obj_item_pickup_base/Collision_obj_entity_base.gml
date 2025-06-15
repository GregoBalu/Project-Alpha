if (can_pickup) {
    
    //show_debug_message("only_player={0} other={1}", only_player, other);
    if (only_player && other.id != obj_player.id) {
        //show_debug_message("Not player!");
        exit;
    }
    
    //show_debug_message("Pickup");
    if (onPickup(other)) {
        instance_create_layer(other.x, other.y, "GUI", obj_battle_text_roll, {
            text : _pickupText,
            time_seconds : 1.5,
            width : 32,
            heigth : 16,
            color : _pickupColor,
            max_sway: 8,
            vertical_speed: 0.3
        });
        audio_play_sound(snd_ding, 3, false);
        instance_destroy();
    } else {
        can_pickup = false;
        alarm[PICKUP_ALARM] = 1 * TIME_SECOND;
    }
}