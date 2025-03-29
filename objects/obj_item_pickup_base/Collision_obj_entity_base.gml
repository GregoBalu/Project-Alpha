if (can_pickup) {
    
    //show_debug_message("only_player={0} other={1}", only_player, other);
    if (only_player && other.id != obj_player.id) {
        //show_debug_message("Not player!");
        exit;
    }
    
    //show_debug_message("Pickup");
    if (onPickup(other)) {
        instance_destroy();
    } else {
        can_pickup = false;
        alarm[PICKUP_ALARM] = 1 * TIME_SECOND;
    }
}