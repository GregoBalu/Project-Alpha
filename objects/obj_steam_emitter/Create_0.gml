// Inherit the parent event
event_inherited();

getBuffData = function(_othr) {
    return {
        obj : obj_buff_dark,
        data : {
            targetObject : _othr,
            duration_seconds : darkness_duration_seconds,
            sight_radius : darkness_sight_radius
        }
    };
}


var _cx = x + sprite_width/2;
var _cy = y + sprite_height/2;
audio_falloff_set_model(audio_falloff_linear_distance);
sound = audio_play_sound_at(snd_steam, _cx, _cy, 0, 4, 256, 1, true, AUDIO_PRIO_NOISE, 0.2*global.audio_master_volume*global.audio_sfx_volume, 0.5, 1.1);
audio_sound_loop_start(sound, 0.5);
