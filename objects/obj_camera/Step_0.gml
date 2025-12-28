/*if (follow_player && !instance_exists(obj_dialog)) {
    follow_point = new Vec2(obj_player.x, obj_player.y);

} else {

    
}

var _cam_x = follow_point.x - cam_w/2 + offset.x;
_cam_x = clamp(_cam_x, 0, room_width-cam_w);
var _cam_y = follow_point.y - cam_h/2 + offset.y;
_cam_y = clamp(_cam_y, 0, room_height-cam_h);

camera_set_view_pos(cam, _cam_x, _cam_y);*/

if (previous_zoom_factor != zoom_factor) {
    cam_w = orig_cam_w * zoom_factor;
    cam_h = orig_cam_h * zoom_factor;
    cam_w2 = cam_w / 2;
    cam_h2 = cam_h / 2;
    
    previous_zoom_factor = zoom_factor;
}