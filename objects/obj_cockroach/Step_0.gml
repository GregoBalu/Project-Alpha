// Inherit the parent event
event_inherited();

if (follow_target == noone && distance_to_object(obj_player) < follow_max_distance) {
    set_follow_target(obj_player);
}