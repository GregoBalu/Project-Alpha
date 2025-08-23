// Inherit the parent event
event_inherited();

enum ProjectileSpitterAlarms { ShootCycle = 0, CheckPlayerClose = 11};

direction = image_angle;

shoot = function() {
    if (DEBUG) show_debug_message($"Shooting -> {direction}");
    var _id = instance_create_layer(x, y, "Traps", obj_projectile, {
        direction: direction,
        length: maxLength,
        move_speed: projSpeed
    });
    //_id.direction = direction;
    
}

alarm[ProjectileSpitterAlarms.ShootCycle] = cycleTimeSeconds*TIME_SECOND;