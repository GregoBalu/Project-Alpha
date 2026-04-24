//var _feet_y = y + 8;
//depth = 5500;

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
var _gs = obj_shroud.grid_size /2;
//if (current_location.distance(previous_shroud_location) >= 0.5) {
if (current_location.x div _gs != previous_shroud_location.x div _gs ||
    current_location.y div _gs != previous_shroud_location.y div _gs) {
        
    //shroud_set_fog();
    shroud_set_fog_around(previous_shroud_location.x, previous_shroud_location.y, obj_shroud.clear_grid_size*obj_shroud.grid_size);
    
    shroud_clear_position(x, y, no_see_tilemaps, current_shroud_mask);
    previous_shroud_location = current_location;
}
delete current_location;
