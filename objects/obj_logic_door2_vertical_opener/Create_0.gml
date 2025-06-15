visible = false;

tilemap = layer_tilemap_get_id("Tiles_Col");


door1 = tilemap_get_at_pixel(tilemap, x1, y1);
door2 = tilemap_get_at_pixel(tilemap, x2, y2);
door3 = tilemap_get_at_pixel(tilemap, x3, y3);


On = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, 2, x1, y1);
    tilemap_set_at_pixel(tilemap, 0, x2, y2);
    tilemap_set_at_pixel(tilemap, 0, x3, y3);
    
    if (distance_to_object(obj_player) < 128) {
        audio_falloff_set_model(audio_falloff_exponent_distance);
        audio_play_sound_at(snd_sliding, x1, y1, 0, 0, 128, 2, false, 4, 0.3, 0, random_range(0.9, 1.1));
    }
};

Off = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, door1, x1, y1);
    tilemap_set_at_pixel(tilemap, door2, x2, y2);
    tilemap_set_at_pixel(tilemap, door3, x3, y3);
    
    if (distance_to_object(obj_player) < 128) {
        audio_falloff_set_model(audio_falloff_exponent_distance);
        audio_play_sound_at(snd_sliding, x1, y1, 0, 0, 128, 2, false, 4, 0.3, 0, random_range(0.9, 1.1));
    }
};
