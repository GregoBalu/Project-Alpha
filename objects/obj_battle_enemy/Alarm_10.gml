battle_enemy_crit_noti.visible = false;
battle_player_damaged_stars.visible = false;
battle_enemy_wait_noti.visible = false;

if (sprite_index != data.sprite_index) {
    sprite_index = data.sprite_index;
    image_index = 0;
    image_xscale = data.image_xscale;
    image_yscale = data.image_yscale;
}