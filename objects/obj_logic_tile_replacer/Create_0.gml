visible = false;

tilemap = layer_tilemap_get_id(tilemap_name);

grid_size = 16;
grid_width = floor((x2-x1)/grid_size) +1;
grid_height = floor((y2-y1)/grid_size) +1;
//show_debug_message($"{id}: logic_tile_replacer w={grid_width} h={grid_height} gs={grid_size}");

original_tile_info = ds_grid_create(grid_width, grid_height);
for (var _r = 0; _r < grid_width; ++_r)
{
    for (var _c = 0; _c < grid_height; ++_c)
    {
        original_tile_info[#_r, _c] = tilemap_get_at_pixel(tilemap, x1+(_r*grid_size) , y1+(_c*grid_size));
        //show_debug_message($"t[{_r},{_c}]={original_tile_info[#_r, _c]} @ ({x1+(_r*grid_size)},{y1+(_c*grid_size)})");
    }
}



On = function(_inst_id) {
    
    for (var _r = 0; _r < grid_width; ++_r)
    {
        for (var _c = 0; _c < grid_height; ++_c)
        {
            tilemap_set_at_pixel(tilemap, change_tile_id, x1+(_r*grid_size) , y1+(_c*grid_size));
        }
    }
    //tilemap_set_at_pixel(tilemap, change_tile_id, x1 , y1);
};

Off = function(_inst_id) {
    for (var _r = 0; _r < grid_width; ++_r)
    {
        for (var _c = 0; _c < grid_height; ++_c)
        {
            tilemap_set_at_pixel(tilemap, original_tile_info[#_r, _c], x1+(_r*grid_size) , y1+(_c*grid_size));
        }
    }
   //tilemap_set_at_pixel(tilemap, original_tile_info, x1, y1);
};
