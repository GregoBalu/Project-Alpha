// Inherit the parent event
event_inherited();

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
