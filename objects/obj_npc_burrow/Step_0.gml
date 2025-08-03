// Inherit the parent event
event_inherited();

if (follow_target != noone) {
    
    var _dist = point_distance(follow_target.x, follow_target.y, x, y);
    if (_dist > 92) {
        //stop
    } else {
        var _dir = point_direction(follow_target.x, follow_target.y, x, y);
        var _dx = lengthdir_x(16, _dir);
        var _dy = lengthdir_y(16, _dir);
        
        npc_move_towards_point(follow_target.x+_dx, follow_target.y+_dy);
    }
}

part_system_position(particle_system, x, y);
part_system_depth(particle_system, depth+1);

if (MOVING) {
    if (!particle_emitter_interval_quicken) {
        part_emitter_interval(particle_system, part_emitter, 0, 0.3, time_source_units_seconds);
        part_system_update(particle_system);
        particle_emitter_interval_quicken = true;
    }
} else { 
    if (particle_emitter_interval_quicken) {
        part_emitter_interval(particle_system, part_emitter, 1, 1.5, time_source_units_seconds);
        part_system_update(particle_system);
        particle_emitter_interval_quicken = false;
    }
}
