// Inherit the parent event
event_inherited();

init = function() {
    current_value = audio_group_get_gain(audio_group);
    updateIndicator();
}

onValueChanged = function(new_value) {
    
    //show_debug_message("onValueChanged!")
    audio_group_set_gain(audio_group, new_value, 0.5*TIME_SECOND);
}

init();