
shroud_grid = ds_grid_create(room_width div grid_size, room_height div grid_size);

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


clear_grid_size = 11;

var _sow = 1;
var _soh = 1;

var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

if ((_cam_w mod grid_size) != 0) _sow++;
if ((_cam_h mod grid_size) != 0) _soh++;
    
cam_cell_width = (_cam_w div grid_size) + _sow;
cam_cell_height = (_cam_h div grid_size) + _soh;

debug_level = 0;
debug_list = ds_list_create();
debug_points = ds_list_create();
