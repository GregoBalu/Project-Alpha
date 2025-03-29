if (state == State.Closed) {
    global.do_draw_adventure_gui = true;
} else {
    global.do_draw_adventure_gui = false;
}

if (state == State.Closing || state == State.Opening) {
    if (openingSoundId == undefined || !audio_is_playing(openingSoundId)) {
        openingSoundId = audio_play_sound(snd_paper_turn, 5, true, 1, 1.2);
    }
} else  {
    if (openingSoundId != undefined && audio_is_playing(openingSoundId)) {
        audio_stop_sound(openingSoundId);
        openingSoundId = undefined;
    }
}

if (state == State.Opening) {
    
    if (opening_state < (max_open_state-step_open) ) {
        opening_state += step_open;
    } else {
        state = State.Open;
        opening_state = max_open_state;
    }
} else if (state == State.Closing) {
    if (opening_state > (min_open_state) ) {
        opening_state -= step_open;
    } else {
        state = State.Closed;
        opening_state = min_open_state;
    }
}