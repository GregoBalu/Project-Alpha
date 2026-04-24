//check player distance

if (distance_to_object(obj_player) > obj_camera.cam_w) {
    CHECK_FREQ = 2*TIME_SECOND;
} else {
    CHECK_FREQ = 0.1*TIME_SECOND;
}
alarm[11] = 2*TIME_SECOND;