// Inherit the parent event
event_inherited();

current_value = audio_group_get_gain(audio_group);

function onValueChanged(new_value) {
    
    //show_debug_message("onValueChanged!")
    audio_group_set_gain(audio_group, new_value, 0.5*TIME_SECOND);
}