
var lay_id = layer_get_id("Tiles_Col_Invis");
var lay_id2 = layer_get_id("Tiles_Col");
var map_id = layer_tilemap_get_id(lay_id);
var map_id2 = layer_tilemap_get_id(lay_id2);

var cell_size = 16;
var w = room_width div cell_size;
var h = room_height div cell_size;

global.mp_grid = mp_grid_create(0, 0, w, h, cell_size, cell_size);

for (var i = 0; i < w; i++) {
    for (var j = 0; j < h; j++) {
        if (tilemap_get_at_pixel(map_id, i * cell_size, j * cell_size) > 0)
        {
            mp_grid_add_cell(global.mp_grid, i, j);
        }
        if (tilemap_get_at_pixel(map_id2, i * cell_size, j * cell_size) > 0)
        {
            mp_grid_add_cell(global.mp_grid, i, j);
            
        }
    }
}

with(obj_enemy_base) {
    mp_grid_add_instances(global.mp_grid, self, false);
}

with(obj_collider) {
    mp_grid_add_instances(global.mp_grid, self, false);
}
