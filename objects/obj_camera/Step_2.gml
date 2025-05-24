if (follow_player && !instance_exists(obj_dialog)) {


    var _cam_x = obj_player.x - cam_w/2 + offset.x;
    _cam_x = clamp(_cam_x, 0, room_width-cam_w-2);
    var _cam_y = obj_player.y - cam_h/2 + offset.y;
    _cam_y = clamp(_cam_y, 0, room_height-cam_h);
    
    camera_set_view_pos(cam, _cam_x, _cam_y);
    
}