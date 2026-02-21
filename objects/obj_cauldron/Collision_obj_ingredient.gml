if (state == InterractItemState.Interracted) {
    audio_play_sound(snd_splash, AUDIO_PRIO_EFFECTS, false, 1.4);
    ingredient = other;
    ingredient.disable();
    state = InterractItemState.Undisturbed;
    can_interract = false;
    //alarm[0] = TIME_SECOND;
    can_interract = true;
}