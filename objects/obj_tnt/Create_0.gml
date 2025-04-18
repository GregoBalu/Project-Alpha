explosion_id = -1;
audio_id = -1;
collision_list = ds_list_create();

function explode(){
    
    image_alpha = 0.5;
    explosion_id = spawn_effect(spr_fireball_explosion, x, y, explosion_radius*2, explosion_radius*2, depth-1, 0, 0, 0.5, spr_fireball_explosion, 0.5);
    audio_id = audio_play_sound_at(snd_explosion, x, y, 0, 1, 1, 0.2, false, 5, 1);
    alarm[1] = 0.2 * TIME_SECOND;
    alarm[0] = 0.5 * TIME_SECOND;
    
    if (0 < collision_circle_list(x, y, explosion_radius, [obj_coll_rock], false, true, collision_list, false)) {
        for (var _i = 0; _i < ds_list_size(collision_list); _i++)
        {
            collision_list[|_i].image_alpha = 0.5;
        }
    }
    if (distance_to_object(obj_player) < explosion_radius) {
        obj_player.hp = clamp(obj_player.hp - 6, 0, obj_player.hp_total);
    }
}