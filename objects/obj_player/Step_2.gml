if (!instance_exists(obj_dialog)) {
    var _cam = view_camera[0];
    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
    
    var _cam_x = x - _cam_w/2;
    _cam_x = clamp(_cam_x, 0, room_width-_cam_w-2);
    var _cam_y = y - _cam_h/2;
    _cam_y = clamp(_cam_y, 0, room_height-_cam_h);
    
    camera_set_view_pos(_cam, _cam_x, _cam_y);
}

with (obj_entity_base)
{
    if (distance_to_object(obj_player) > 24) continue;
   // depth = layer_get_depth("Instances") - bbox_bottom;
    if (bbox_bottom > other.bbox_bottom) {
        depth = other.depth - 1;
    } else {
        depth = other.depth + 1;
    }
}

var current_location = new Vec2(x, y);
if (current_location.distance(previous_location) > 0) {
    shroud_set_fog();
    
    shroud_clear_position(x, y, no_see_tilemaps, current_shroud_mask);
}
delete current_location;
