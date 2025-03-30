event_inherited();

input_key = global.input_talk;
can_talk = false;

used_dialog = false;

talk_distance = 8;

target_x = x;
target_y = y;

alarm[1] = random_range(TIME_SECOND, 2*TIME_SECOND);
