function room1_spawn_secret_chestroom(){
    
    
    
    
    instance_create_layer(32, 671, "Instances", obj_enemy_firetoad);
    audio_play_sound(snd_firetoad_croak, 5, false, 1.2, 0, random_range(0.8,1.2));
    instance_create_layer(32, 736, "Instances", obj_enemy_firetoad);
    audio_play_sound(snd_firetoad_idle, 5, false, 1, 0, random_range(0.8,1.2));
    instance_create_layer(128, 671, "Instances", obj_enemy_firetoad);
    audio_play_sound(snd_firetoad_croak, 5, false, 1.1, 0, random_range(0.8,1.2));
    instance_create_layer(128, 736, "Instances", obj_enemy_firetoad);
    audio_play_sound(snd_firetoad_idle, 5, false, 1, 0, random_range(0.8,1.2));
    
    
}