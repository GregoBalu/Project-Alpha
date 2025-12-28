show_debug_message($"Shroud created in {room}");
shroud_grid_width = room_width div grid_size;
shroud_grid_height = room_height div grid_size;
shroud_grid = ds_grid_create(shroud_grid_width, shroud_grid_height);

changed = true;
depth = -1;

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

var _orig_gui_w = camera_get_view_width(view_camera[0]);
var _orig_gui_h = camera_get_view_height(view_camera[0]);

var _scale_w = 1;
var _scale_h = 1;

real_grid_size_w = grid_size * _scale_w;
real_grid_size_h = grid_size * _scale_h;

var _sow = 1;
var _soh = 1;

cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

if ((cam_w mod real_grid_size_w) != 0) _sow++;
if ((cam_h mod real_grid_size_h) != 0) _soh++;
    
cam_cell_width = (cam_w div real_grid_size_w) + _sow;
cam_cell_height = (cam_h div real_grid_size_h) + _soh;

show_debug_message($"cam={cam_w},{cam_h} display={_orig_gui_w},{_orig_gui_h} scale={_scale_w},{_scale_h} real_grid_size={real_grid_size_w},{real_grid_size_h}");

debug_level = 0;
debug_list = ds_list_create();
debug_points = ds_list_create();
debug_find_collider_count = 0;
debug_find_collider_iteration = 0;

debug_sc_list = ds_list_create();

debug_bfs_list = ds_list_create();
debug_bfs_max_dist = 0;

my_surf = undefined;
surf_w = cam_cell_width * real_grid_size_w;
surf_h = cam_cell_height * real_grid_size_h;
