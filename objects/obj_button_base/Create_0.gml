
function clicked() {
    //Override me
    show_debug_message($"Button '{text}' clicked");
    clickAction();
}

width = bbox_right - bbox_left;
height = bbox_bottom - bbox_top;

image_index = 0;
text_color = c_black;


enum ButtonState { Normal, Pressed, Hover };
state = ButtonState.Normal;

show_debug_message($"(instance_exists(obj_dialog)={instance_exists(obj_dialog)?"true":"false"} || global.do_pause={global.do_pause?"true":"false"}");
