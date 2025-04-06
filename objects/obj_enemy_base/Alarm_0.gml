

if (instance_exists(obj_player) && point_distance(xstart,ystart,x,y)<(2*wander_range) &&
         distance_to_object(obj_player) < distance_to_player && !collision_line(x, y, obj_player.x, obj_player.y, no_see_tilemaps, false, false))
{
    see_player = true;
    target_x = obj_player.x;
    target_y = obj_player.y;
}
else {
    see_player = false;
    if(random_range(0, 10) < 3) {
        //stay put
    } else {
        target_x = random_range(xstart - wander_range, xstart + wander_range);
        target_y = random_range(ystart - wander_range, ystart + wander_range);
        //TODO: better wandering
    }
}

alarm[0] = move_tickdelay_seconds * TIME_SECOND;