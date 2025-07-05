coll = layer_tilemap_get_id("Tiles_Col");
particle_system = part_system_create(ps_water_splash);
part_emitter = part_emitter_create(particle_system);

enabled = true;

part_system_position(particle_system, x, y);
part_emitter_enable(particle_system, part_emitter, true);

target = new Vec2(0, 0);
current_speed = 1;

generate_new_target = function() {
    delete target;
    target = new Vec2(random_range(obj_fish_manager.room_margin, room_width-obj_fish_manager.room_margin), random_range(obj_fish_manager.room_margin, room_height-obj_fish_manager.room_margin));
    current_speed = random_range(0.5, 2);
}

generate_new_target();