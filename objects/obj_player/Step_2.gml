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
