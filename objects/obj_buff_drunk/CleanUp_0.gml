alarm[0] = 0;
targetObject.move_speed = original_speed;
part_emitter_destroy(particle_system, part_emitter);
part_system_destroy(particle_system);

// Inherit the parent event
event_inherited();

