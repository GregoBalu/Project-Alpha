checkPlayerTooFar = function() {
    
    if (distance_to_object(obj_player) > camera_get_view_width(obj_player.camera.cam)*2) {
        if (!paused) {
            paused = true;
            visible = false;
            onPauseChanged();
        }
    } else {
        if (paused) {
            paused = false;
            visible = should_be_visible;
            onPauseChanged();
        }
    }
    
    alarm[11] = random_range(1.5, 2.5)*TIME_SECOND;
}
onPauseChanged = function() {
    
}
onPlayerCollide = function() {
    //override me
}

checkPlayerTooFar();

hitboxes = [];
hitboxes_len = 0;
