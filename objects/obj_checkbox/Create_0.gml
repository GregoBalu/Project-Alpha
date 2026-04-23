init_localisation();

image_speed = 0;
refresh_image = function() {
    if (checked) {
        image_index = 1;
    } else {
        image_index = 0;
    }
}
refresh_image();

onChanged = function() {
    // override me
}
