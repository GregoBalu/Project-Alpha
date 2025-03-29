if (!obj_battle_manager.battle_started)
    return;

display_set_gui_size(room_width, room_height);

if (hint != undefined && hint != "" && point_in_rectangle(mouse_x, mouse_y, x, y, x+sprite_width, y+sprite_height)) {
    var _x = x;
    var _y = y;
    
    var _w_half = sprite_width/2;
    
    var _halign = fa_left;
    if (_x > display_get_gui_width()/2) {
        _x -= _w_half;
        _halign = fa_right;
    } else {
        _x += _w_half;
    }
    
    _x += clamp(mouse_x-x, -_w_half/2, _w_half);
    _y += clamp(mouse_y-y, -sprite_height/4, sprite_height/2);
    
    draw_textbox_background(_x, _y, 64, 64, hint, new BackgroundData(spr_hint_back, 0, 8), _halign, fa_bottom);
}