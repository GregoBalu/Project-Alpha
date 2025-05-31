
var _cam_x = (follow_point.x - cam_w2) ;
_cam_x = clamp(_cam_x, 0, room_width-cam_w)+ offset.x;
var _cam_y = (follow_point.y - cam_h2) ;
_cam_y = clamp(_cam_y, 0, room_height-cam_h)+ offset.y;


camera_set_view_pos(cam, _cam_x, _cam_y);