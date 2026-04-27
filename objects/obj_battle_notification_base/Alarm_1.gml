/// @description Fade out handler

if (!visible) {
    image_alpha = 1;
    exit;
}

image_alpha -= 0.25;

if (image_alpha > 0) {
    alarm[1] = 5;
} else {
    visible = false;
    image_alpha = 1;
}
