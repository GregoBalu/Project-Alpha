///Fade handler alarm

effectData.progress += FadeTickAmount;
show_debug_message($"Room change manager effect fade progress {effectData.progress}");

if (effectData.progress >= 100 && !changed_room) {
    //After fade out
    effectData.progress = 100;
    FadeTickAmount = -1*FadeTickAmount;
    alarm[RoomChangerManagerAlarms.ChangeRoom] = 1;
    return;
} else if (effectData.progress <= 0 && changed_room) {
    //After Fade in
    instance_destroy();
    return;
}

alarm[RoomChangerManagerAlarms.Fade] = FadeTick;