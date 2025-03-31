if (state == InterractItemState.Interracted) {
    audio_play_sound(snd_splash, 5, false, 1.4);
    instance_destroy(other);
    state = InterractItemState.Undisturbed;
}