

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
with (obj_collider)
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
if (current_location.distance(previous_shroud_location) >= 0.5) {
    
    //shroud_set_fog();
    shroud_set_fog_around(previous_shroud_location.x, previous_shroud_location.y, (shroud_radius+1)*obj_shroud.grid_size);
    
    shroud_clear_position(x, y, no_see_tilemaps, current_shroud_mask);
    previous_shroud_location = current_location;
}
delete current_location;
