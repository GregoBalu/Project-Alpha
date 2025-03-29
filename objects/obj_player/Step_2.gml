
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

if (MOVING) {
    shroud_set_fog();
    
    shroud_clear_position(x, y, light_tilemaps, current_shroud_mask);
}
