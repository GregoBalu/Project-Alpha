{
    for (var _i = 0; _i < ds_list_size(particles); ++_i)
    {
        part_emitter_destroy(particles[|_i].ps, particles[|_i].pe);
        part_system_destroy(particles[|_i].ps);
    }
    ds_list_destroy(particles);
}