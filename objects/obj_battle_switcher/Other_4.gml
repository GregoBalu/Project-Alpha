if (room != rm_battle)
{
    alarm[0] = TIME_SECOND;
}

if (room == rm_battle){
    var _layer_id = layer_get_id("Background");
    var _back_id = layer_background_get_id(_layer_id);
    layer_background_sprite(_back_id, enemy_data.battle.battle_screen_sprite);
    layer_background_speed(_back_id, enemy_data.battle.battle_screen_sprite_speed);
}