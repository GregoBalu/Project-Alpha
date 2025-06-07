initDialog();

messages = [];
current_message = -1;
current_char = 0;
draw_message = "";
has_more = false;
at_end = false;

char_speed = 0.7;
input_key = global.input_talk;

gui_w = 720;
gui_h = 540;

speaker_sprite_width = gui_w*0.3

sprite_animate_x = speaker_sprite_width;

choice_need_scroll = false;
choice_scroll = 0;

