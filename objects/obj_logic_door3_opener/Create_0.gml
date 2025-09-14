visible = false;

tilemap = layer_tilemap_get_id("Tiles_Col");


door1 = tilemap_get_at_pixel(tilemap, x1, y1);
door2 = tilemap_get_at_pixel(tilemap, x2, y2);
door3 = tilemap_get_at_pixel(tilemap, x3, y3);

left = (x1 div 16) * 16;
right = left + 15;
top = (y1 div 16) * 16;
bottom = top + 16*3 -1;
center_horizontal = (left+right) / 2;
center_vertical = (bottom+top) / 2;


On = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, 0, x1, y1);
    tilemap_set_at_pixel(tilemap, 0, x2, y2);
    tilemap_set_at_pixel(tilemap, 0, x3, y3);
    
    if (distance_to_object(obj_player) < 128) {
        audio_falloff_set_model(audio_falloff_exponent_distance);
        audio_play_sound_at(snd_sliding, x2, y2, 0, 0, 128, 2, false, 4, 0.3, 0, random_range(0.9, 1.1));
    }
};

Off = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, door1, x1, y1);
    tilemap_set_at_pixel(tilemap, door2, x2, y2);
    tilemap_set_at_pixel(tilemap, door3, x3, y3);
    
    var _coll = collision_rectangle(left, top, right, bottom, obj_player, false, true);
    if (_coll != noone) {
        if (obj_player.y < center_vertical) {
            //push left
            obj_player.y -= obj_player.bbox_bottom - top + 1;
        } else {
            //push right
            obj_player.y += bottom - obj_player.bbox_top + 1;
        }
    }
    
    if (distance_to_object(obj_player) < 128) {
        audio_falloff_set_model(audio_falloff_exponent_distance);
        audio_play_sound_at(snd_sliding, x2, y2, 0, 0, 128, 2, false, 4, 0.3, 0, random_range(0.9, 1.1));
    }
};
