//x = camera_get_view_x(view_camera[0]) ;
//y = camera_get_view_y(view_camera[0]) ;
//camera_get_view_width()

if (ds_list_size(buffs) > 0) {
    visible = global.do_draw_adventure_gui;
} else {
    visible = false;
    return;
}

height = padding + (padding+32)*ds_list_size(buffs);

var _yshift = padding;

for (var _i = 0; _i < ds_list_size(buffs); _i++)
{
    buffs[|_i].x = x + padding;
    buffs[|_i].y = y + _yshift;
    buffs[|_i].depth = depth - 1;
    buffs[|_i].visible = visible;
    _yshift += buffs[|_i].sprite_height + padding;
}

