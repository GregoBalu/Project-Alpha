visible = false;

tilemap = layer_tilemap_get_id("Tiles_Col");


door1 = tilemap_get_at_pixel(tilemap, x1, y1);
door2 = tilemap_get_at_pixel(tilemap, x2, y2);
door3 = tilemap_get_at_pixel(tilemap, x3, y3);


On = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, 2, x1, y1);
    tilemap_set_at_pixel(tilemap, 0, x2, y2);
    tilemap_set_at_pixel(tilemap, 0, x3, y3);
};

Off = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, door1, x1, y1);
    tilemap_set_at_pixel(tilemap, door2, x2, y2);
    tilemap_set_at_pixel(tilemap, door3, x3, y3);
};
