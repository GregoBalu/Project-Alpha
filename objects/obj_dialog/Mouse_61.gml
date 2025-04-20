if (messages[current_message].type == DialogType.Choice && choice_need_scroll) {
    choice_scroll = clamp(choice_scroll+1, 0, array_length(messages[current_message].choices)-1);
}