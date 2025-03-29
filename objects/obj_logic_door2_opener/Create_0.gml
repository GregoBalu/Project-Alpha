visible = false;

tilemap = layer_tilemap_get_id("Tiles_Col");


door1 = tilemap_get_at_pixel(tilemap, x1, y1);
door2 = tilemap_get_at_pixel(tilemap, x2, y2);


On = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, 0, x1, y1);
    tilemap_set_at_pixel(tilemap, 0, x2, y2);
};

Off = function(_inst_id) {
    tilemap_set_at_pixel(tilemap, door1, x1, y1);
    tilemap_set_at_pixel(tilemap, door2, x2, y2);
};
