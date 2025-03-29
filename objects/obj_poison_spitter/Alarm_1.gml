//animate time
if (image_index == max_image_index) {
    alarm[0] = 1;
    return;
}

++image_index;
alarm[1] = 0.2*TIME_SECOND;