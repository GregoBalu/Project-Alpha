
function clicked() {
    //Override me
}

width = bbox_right - bbox_left;
height = bbox_bottom - bbox_top;

image_index = 0;
text_color = c_black;


enum ButtonState { Normal, Pressed, Hover };
state = ButtonState.Normal;
