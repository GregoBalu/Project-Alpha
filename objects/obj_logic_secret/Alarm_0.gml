
if (point_in_rectangle(obj_player.x, obj_player.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    audio_play_sound(snd_achieve2, AUDIO_PRIO_EFFECTS, false);
    obj_player.statistic.secrets_found++;
    instance_destroy();
    return;
}

alarm[0] = recheck_time;