if (!battle_started) {
    display_set_gui_size(room_width, room_height);
    draw_sprite(spr_battle_screen_splitted, background_subimg, 0, 0);
    
} else {
    display_set_gui_size(room_width, room_height);
    
    function draw_buffs_at(_buffs, _x, _y) {
        //draw_textbox(_x, _y, 16, 16, "BUFFS");
        
        if (ds_list_empty(_buffs)) return;
        
        var _offset = sin(time/(TIME_SECOND));
        if (_offset < -0.5) _offset = -1;
        else if (_offset > 0.5) _offset = 1;
        else _offset = 0;
            
        _x += _offset;
        
        var _w = 16;
        var _h = 16;
        var _gap = 1;
        
        draw_set_alpha(0.6);
        draw_rectangle_color(_x-_gap, _y-_gap, _x+_w+_gap-1, _y+ds_list_size(_buffs)*(_h+_gap)-1, c_gray, c_gray, c_gray, c_gray, false);
        draw_set_alpha(1);
        
        for (var _i = 0; _i < ds_list_size(_buffs); ++_i)
        {
            var _sprite = _buffs[|_i].data.sprite ?? spr_debug_16;
            
            var _tl = new Vec2(_x, _y+_i*(_h+_gap));
            
            draw_sprite_stretched(_sprite, 0, _tl.x, _tl.y, _w, _h);
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _tl.x, _tl.y, _tl.x + _w -1, _tl.y + _h -1)) {
                draw_textbox_background(mouse_gui_x, mouse_gui_y, 128, 32, _buffs[|_i].data.hint, 
                        new BackgroundData(spr_hint_back, 0, 2), (mouse_gui_x<=(room_width/2))?fa_left:fa_right);
            }
        }
    }
    
    draw_buffs_at(obj_battle_player.buffs, 30, 10);
    draw_buffs_at(obj_battle_enemy.buffs, 226, 10);
    
}