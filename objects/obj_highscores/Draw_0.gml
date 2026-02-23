
var _dx = xstart + 16;
var _dy = ystart + 16;

for (var _i = 0; _i < ds_list_size(scores); _i++)
{
    draw_textbox(_dx, _dy, 576, 16, $"{date_date_string(scores[|_i].time)} {date_time_string(scores[|_i].time)} : {scores[|_i].hscore}");
    
    
    _dy += 16;
    if (_dy > bbox_bottom) break;
}
