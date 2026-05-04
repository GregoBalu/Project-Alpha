
if (!immobilized) {
    sprite_angle = point_direction(x, y, target_x, target_y)-90;
}

if (MOVING) {
    image_speed = 1;
} else {
    image_speed = 0;
    image_index = 0;
}
