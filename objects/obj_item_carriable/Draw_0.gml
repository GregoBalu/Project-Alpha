if (carried_by == noone) {
    var _edge_x = sprite_width/16;
    var _edge_y = sprite_height/16;
    
    var _w = (sprite_width + 2*_edge_x -2) * (1+sin(_background_sprite_time/_background_sprite_refresh_rate)/10) ;
    var _h = (sprite_height + 2*_edge_y -2) * (1+sin(_background_sprite_time/_background_sprite_refresh_rate)/10) ;
    //var _x = x - _edge_x;// + _w/2;
    //var _y = y - _edge_y;// + _h/2;
    
    var _center_x = x ;//+ sprite_width/2;
    var _center_y = y ;//+ sprite_height/2;
    var _x = _center_x - _w/2;
    var _y = _center_y - _h/2;
    
    
    draw_sprite_stretched_ext(spr_glow, 0, _x, _y, _w, _h, c_white, 0.5);
}

draw_self();