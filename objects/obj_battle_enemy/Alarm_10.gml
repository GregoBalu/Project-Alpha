battle_enemy_crit_noti.visible = false;
battle_player_damaged_stars.visible = false;
battle_enemy_wait_noti.visible = false;

if (sprite_index != data.sprite_index) {
    sprite_index = data.sprite_index;
    image_index = 0;
    image_xscale = data.image_xscale;
    image_yscale = data.image_yscale;
}

if (data.battle.idle_sound != noone) {
    alarm[5] = random_range(data.battle.idle_sound_min_seconds, data.battle.idle_sound_max_seconds) * TIME_SECOND;
}