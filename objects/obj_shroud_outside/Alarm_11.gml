//check player distance

if (point_distance(x, y, obj_player.x, obj_player.y) > obj_camera.cam_w*1.5) {
    CHECK_FREQ = 2*TIME_SECOND;
} else {
    CHECK_FREQ = 0.5*TIME_SECOND;
}
alarm[11] = 2*TIME_SECOND;