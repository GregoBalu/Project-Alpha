if (!immune) {
    var _id = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, collision_array, false, true);
    if (_id != noone) {
        if (DEBUG) show_debug_message($"Projectile collision @ ({x},{y}) with {_id}");
        if (_id == obj_player_hitbox.id) {
            //damage player
            obj_player.damage_receive(damageToPlayer);
        }
        instance_destroy();
        return;
    }
    }

if (point_distance(xstart, ystart, x, y) > length) {
    if (DEBUG) show_debug_message($"Projectile too far");
    instance_destroy();
    return;
}

//move forward
var _dx = lengthdir_x(move_speed, direction);
var _dy = lengthdir_y(move_speed, direction);
x += _dx;
y += _dy;
if (DEBUG) show_debug_message($"Projectile moved to ({x},{y})");