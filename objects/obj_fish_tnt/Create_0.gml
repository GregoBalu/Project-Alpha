event_inherited();

explosion_id = -1;
audio_id = -1;
explosion_radius = 16;


function explode(){
    show_debug_message("Fish TNT explode");
    image_alpha = 0.5;
    explosion_id = spawn_effect(spr_fireball_explosion, x, y, explosion_radius*2, explosion_radius*2, depth-1, 0, 0, 0.5, spr_fireball_explosion, 0.5);
    audio_id = audio_play_sound_at(snd_explosion, x, y, 0, 1, 1, 0.2, false, 5, 1);
    alarm[1] = 0.2 * TIME_SECOND;
    
    alarm[0] = 0.5 * TIME_SECOND;
}

onPathEnd = function() {
    explode();
}