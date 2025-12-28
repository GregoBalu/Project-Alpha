/// Spin effect tick handler

effectData.progress += SpinTickAmount;
show_debug_message($"Room change manager effect spin progress {effectData.progress} -> {7.2*effectData.progress}");

camera_set_view_angle(obj_camera.cam, 7.2*effectData.progress);
if (changed_room) {
    obj_camera.zoom_factor = 1 - (1-clamp(effectData.progress/100, 0, .8));
} else {
    obj_camera.zoom_factor = 1 - clamp(effectData.progress/100, 0, .8);
}

if (effectData.progress >= 100 && !changed_room) {
    //After spin full
    effectData.progress = 0;
    camera_set_view_angle(obj_camera.cam, 0);
    obj_camera.zoom_factor = 1;
    alarm[RoomChangerManagerAlarms.ChangeRoom] = 1;
    return;
} else if (effectData.progress > 100 && changed_room) {
    //After Spin in
    camera_set_view_angle(obj_camera.cam, 0);
    obj_camera.zoom_factor = 1;
    instance_destroy();
    return;
}

alarm[RoomChangerManagerAlarms.Spin] = SpinTick;