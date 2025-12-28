/// Spiral effect tick handler

effectData.progress += SpiralTickAmount;
effectData.subimg = (effectData.subimg + 1) % 3;
show_debug_message($"Room change manager effect spiral progress {effectData.progress}");

if (effectData.progress >= 100 && !changed_room) {
    //After spiral full
    effectData.progress = 100;
    SpiralTickAmount = -1*SpiralTickAmount;
    alarm[RoomChangerManagerAlarms.ChangeRoom] = 1;
    return;
} else if (effectData.progress <= 0 && changed_room) {
    //After Spiral in
    instance_destroy();
    return;
}

alarm[RoomChangerManagerAlarms.Spiral] = SpiralTick;
