event_inherited();

input_key = global.input_talk;
can_talk = false;

used_dialog = false;

talk_distance = 8;
talk_index = 0;

target_x = x;
target_y = y;

alarm[1] = random_range(TIME_SECOND, 2*TIME_SECOND);

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
