explosion_id = -1;
audio_id = -1;

function explode(){
    
    image_alpha = 0.5;
    explosion_id = spawn_effect(spr_fireball_explosion, x, y, (bbox_right-bbox_left)*3, (bbox_bottom-bbox_top)*3, depth-1, 0, 0, 0.5, spr_fireball_explosion, 0.5);
    audio_id = audio_play_sound_at(snd_explosion, x, y, 0, 1, 1, 0.2, false, 5, 1);
    alarm[1] = 0.2 * TIME_SECOND;
    alarm[0] = 0.5 * TIME_SECOND;
}