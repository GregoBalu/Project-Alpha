if (!can_start) {
    exit;
}

if (is_on && !paused && !damaged_recently) {
    obj_player.hp = clamp(obj_player.hp - damage_to_player, 0, obj_player.hp_total);
    obj_player.statistic.damage_by_balltrap += damage_to_player;
    obj_player.statistic.damage_by_balltrap_count++;
    damaged_recently = true;
    alarm[0] = 0.5*TIME_SECOND;
}

var _dist = ball_speed/TIME_SECOND;
var _dir = point_direction(x, y, other.x, other.y);
with (obj_player) {
    move_and_collide(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), collision_array, undefined, undefined, undefined, _dist, _dist);
}