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

audio_falloff_set_model(audio_falloff_exponent_distance);
var _cx = x + sprite_width/2;
var _cy = y + sprite_height/2;
sound = audio_play_sound_at(snd_steam, _cx, _cy, 0, 32, 64, 2, true, 5, 0.1*global.audio_master_volume*global.audio_sfx_volume, 0.5, 1.1);
audio_sound_loop_start(sound, 0.5);
