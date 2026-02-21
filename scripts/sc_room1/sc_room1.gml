function room1_spawn_secret_chestroom(){
    
    //spawn 3

    var _rand = choose(1, 2, 3, 4);
    if (_rand != 1) {
        instance_create_layer(32, 671, "Instances", obj_enemy_firetoad);
        audio_play_sound(snd_firetoad_croak, AUDIO_PRIO_NOISE, false, 1.2, 0, random_range(0.8,1.2));
    } 
    if (_rand != 2) {
        instance_create_layer(32, 736, "Instances", obj_enemy_firetoad);
        audio_play_sound(snd_firetoad_idle, AUDIO_PRIO_NOISE, false, 1, 0, random_range(0.8,1.2));
    }
    if (_rand != 3) {
        instance_create_layer(128, 671, "Instances", obj_enemy_firetoad);
        audio_play_sound(snd_firetoad_croak, AUDIO_PRIO_NOISE, false, 1.1, 0, random_range(0.8,1.2));
    } 
    if (_rand != 4) {
        instance_create_layer(128, 736, "Instances", obj_enemy_firetoad);
        audio_play_sound(snd_firetoad_idle, AUDIO_PRIO_NOISE, false, 1, 0, random_range(0.8,1.2));
    }
    
    
}