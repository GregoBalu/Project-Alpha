if (state == InterractItemState.Interracted) {
    audio_play_sound(snd_splash, 5, false, 1.4);
    ingredient = other;
    instance_destroy(other);
    state = InterractItemState.Undisturbed;
    can_interract = false;
    //alarm[0] = TIME_SECOND;
    can_interract = true;
}