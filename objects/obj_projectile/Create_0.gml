alarm[11] = 0;
//No optim. needed

collision_array = [obj_collider, obj_player, layer_tilemap_get_id("Tiles_Col")];

if (DEBUG) show_debug_message($"Projectile created @ ({x},{y}) -> {direction}");
    
image_angle = direction;
    
immune = true;
if (projectile_immun_time <= 0) immune = false;
else alarm[0] = projectile_immun_time;