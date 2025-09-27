shroud_grid_width = room_width div grid_size;
shroud_grid_height = room_height div grid_size;
shroud_grid = ds_grid_create(shroud_grid_width, shroud_grid_height);

/*var default_shroud_data = {
    alpha: DEFAULT_SHROUD_ALPHA,
    checked:false,
    debug:""
};*/
ds_grid_clear(shroud_grid, DEFAULT_SHROUD_ALPHA);
/*for (var r = 0; r < grid_size; r++)
{
    for (var c = 0; c < grid_size; c++)
    {
        shroud_grid[#r, c] = variable_clone(default_shroud_data);
    }
}*/


clear_grid_size = 10 * (16/grid_size) +1;//should be odd

var _sow = 1;
var _soh = 1;

cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

if ((cam_w mod grid_size) != 0) _sow++;
if ((cam_h mod grid_size) != 0) _soh++;
    
cam_cell_width = (cam_w div grid_size) + _sow;
cam_cell_height = (cam_h div grid_size) + _soh;

debug_level = 0;
debug_list = ds_list_create();
debug_points = ds_list_create();
debug_find_collider_count = 0;
debug_find_collider_iteration = 0;

debug_sc_list = ds_list_create();

debug_bfs_list = ds_list_create();
debug_bfs_max_dist = 0;

my_surf = undefined;
