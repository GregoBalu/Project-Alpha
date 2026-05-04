// Inherit the parent event
event_inherited();

//speed_boost;
original_speed = targetObject.move_speed;

particle_system = part_system_create(ps_bubbles);
part_emitter = part_emitter_create(particle_system);
part_system_depth(particle_system, obj_player.depth-1);

part_system_position(particle_system, obj_player.x, obj_player.y);
part_emitter_enable(particle_system, part_emitter, true);

alarm[0] = random_range(1, 3)*TIME_SECOND;