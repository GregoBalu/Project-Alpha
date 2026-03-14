///check collision
 
var _id = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true);

if (_id == noone) {
    player_inside = false;
    
    obj_player.change_shroud_mask(obj_player.default_shroud_mask)
} else {
    player_inside = true;
    obj_player.change_shroud_mask(obj_player.outside_shroud_mask)
}


alarm[0] = CHECK_FREQ;