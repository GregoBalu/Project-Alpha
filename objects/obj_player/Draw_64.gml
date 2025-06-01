if (!debug_visualize_mp_grid) exit;
    

display_set_gui_size(camera_get_view_width(camera.cam), camera_get_view_height(camera.cam));

var cell_size = 16;

var _topleft_x = camera_get_view_x(camera.cam);
var _topleft_y = camera_get_view_y(camera.cam);


var _start_x = (_topleft_x div cell_size);
var _start_y = (_topleft_y div cell_size);


var _w = _start_x + camera_get_view_width(camera.cam) div cell_size;
var _h = _start_y + camera_get_view_height(camera.cam) div cell_size;

draw_set_alpha(0.3);
for (var _i = _start_x; _i < _w; _i++)
{
    for (var _j = _start_y; _j < _h; _j++)
    {
        var _cell = mp_grid_get_cell(global.mp_grid, _i, _j);
        if (_cell == 0) {
            draw_rectangle_color(_i*cell_size-_topleft_x, _j*cell_size-_topleft_y, _i*cell_size+cell_size-_topleft_x, _j*cell_size+cell_size-_topleft_y, c_green, c_green, c_green, c_green, false);
        } else if (_cell == -1) {
            draw_rectangle_color(_i*cell_size-_topleft_x, _j*cell_size-_topleft_y, _i*cell_size+cell_size-_topleft_x, _j*cell_size+cell_size-_topleft_y, c_red, c_red, c_red, c_red, false);
        } else {
            draw_rectangle_color(_i*cell_size-_topleft_x, _j*cell_size-_topleft_y, _i*cell_size+cell_size-_topleft_x, _j*cell_size+cell_size-_topleft_y, c_yellow, c_yellow, c_yellow, c_yellow, false);
        }
    }
}
draw_set_alpha(1);
