///check collision
 
var _id = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true);

if (_id == noone && player_inside) {
    player_inside = false;
    if (!did_unset) {
        obj_player.change_shroud_mask(obj_player.default_shroud_mask);
        obj_player.is_inside_shroud = true;
        did_unset = true;
        did_set = false;
    }
} else if (!player_inside) {
    player_inside = true;
    if (!did_set) {
        obj_player.change_shroud_mask(obj_player.outside_shroud_mask);
        obj_player.is_inside_shroud = false;
        did_set = true;
        did_unset = false;
    }
}


alarm[0] = CHECK_FREQ;