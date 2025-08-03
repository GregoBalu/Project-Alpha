/// @description Wandering update alarm

var _wander_distance = point_distance(wander_origin_x, wander_origin_y, x, y);
var _player_distance = distance_to_object(obj_player);//point_distance(x, y, obj_player.x, obj_player.y);
if (_wander_distance <= wander_range && _player_distance <= talk_distance){
    //stop
} /*else if (_wander_distance <= wander_range && _player_distance < wander_range*2) {
    var _len = point_distance(xstart, ystart, obj_player.x, obj_player.y) - _wander_distance;
    var _dir = point_direction(xstart, ystart, obj_player.x, obj_player.y);
    target_x = xstart + lengthdir_x(_len, _dir);
    target_y = ystart + lengthdir_y(_len, _dir);
} */else {
    target_x = random_range(wander_origin_x - wander_range, wander_origin_x + wander_range);
    target_y = random_range(wander_origin_y - wander_range, wander_origin_y + wander_range);
}

alarm[NPCAlarms.Wandering_Update] = random_range(2*TIME_SECOND, 4*TIME_SECOND);