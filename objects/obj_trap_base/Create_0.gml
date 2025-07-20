checkPlayerTooFar = function() {
    
    if (distance_to_object(obj_player) > camera_get_view_width(obj_player.camera.cam)*2) {
        paused = true;
    } else {
        paused = false;
    }
    
    alarm[11] = random_range(1.5, 2.5)*TIME_SECOND;
}

checkPlayerTooFar();