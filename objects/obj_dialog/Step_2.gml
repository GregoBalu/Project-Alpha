if (current_message < 0) exit;
    
if (sprite_animate_x > 0) {
    sprite_animate_x -= 10;
}
    
var _str = messages[current_message].msg.text;

if (floor(current_char) < string_length(_str)) {
    current_char += char_speed * (1 + real(keyboard_check(input_key)) );
    
    draw_message = string_copy(_str, 0, floor(current_char));
    
    has_more = false;
    at_end = false;
    
} 
else {
    
    has_more = (current_message+1 < array_length(messages));
    at_end = (current_message+1 == array_length(messages));
    
    if (keyboard_check_pressed(input_key)) {
        messages[current_message].onEnd();
        current_message++;
        if (current_message >= array_length(messages)) {
            instance_destroy();
        } else {
            choice_need_scroll = false;
            choice_scroll = 0;
            current_char = 0;
            sprite_animate_x = speaker_sprite_width;
            messages[current_message].onStart();
        }
    }
}