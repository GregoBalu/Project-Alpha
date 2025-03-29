messages = [];
current_message = -1;
current_char = 0;
draw_message = "";
has_more = false;
at_end = false;

char_speed = 0.7;
input_key = global.input_talk;

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

speaker_sprite_width = gui_w*0.3

sprite_animate_x = speaker_sprite_width;

