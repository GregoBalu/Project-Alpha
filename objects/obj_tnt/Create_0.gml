explosion_id = -1;
audio_id = -1;
collision_list = ds_list_create();

function explode(){
    
    if (distance_to_object(obj_player) <= (camera_get_view_width(obj_player.camera.cam)+64) ) {
        image_alpha = 0.5;
        explosion_id = spawn_effect(spr_fireball_explosion, x, y, explosion_radius*2, explosion_radius*2, depth-1, 0, 0, 0.5, spr_fireball_explosion, 0.5);
        audio_id = audio_play_sound_at(snd_explosion, x, y, 0, 1, 1, 0.3, false, AUDIO_PRIO_UNIQUE, 1);
        alarm[1] = 0.2 * TIME_SECOND;
    }
    
    alarm[0] = 0.5 * TIME_SECOND;
    
    if (0 < collision_circle_list(x, y, explosion_radius, [obj_coll_rock,obj_coll_crate], false, true, collision_list, false)) {
        for (var _i = 0; _i < ds_list_size(collision_list); _i++)
        {
            collision_list[|_i].image_alpha = 0.5;
        }
    }
    if (distance_to_object(obj_player_hitbox) < explosion_radius) {
        obj_player.hp = clamp(obj_player.hp - damage, 0, obj_player.hp_total);
        obj_player.statistic.damage_by_tnt += damage;
        obj_player.statistic.damage_by_tnt_count++;
    }
}