
cam = view_camera[0];

shake = false;
shake_delay = 0;//ticks
shake_time = 0;//ticks
shake_magnitude = 0;//scale
shake_fade = 0.25;//decrease per ticks

camera_origin = new Vec2(0, 0);

show_debug_message("Camera shake created");

/*function start() {
    view_camera[0] = view_camera[1];
}

function end() {
    view_camera[0] = cam;
}*/