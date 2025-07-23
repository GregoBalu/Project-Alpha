
default_scale = image_xscale;

time = sync?0:random_range(0, 10);


checkPlayerTooFar = function() {
    
    if (distance_to_object(obj_player) > camera_get_view_width(obj_player.camera.cam)) {
        paused = true;
        visible = false;
    } else {
        paused = false;
        visible = true;
    }
    
    alarm[11] = random_range(1.5, 2.5)*TIME_SECOND;
}

checkPlayerTooFar();
