++frame;
if (frame > refresh_frame_count) {
    frame = 0;
    //mp_grid_clear_all(global.mp_grid);
    //refresh();
}

/*with(obj_enemy_base) {
    
    var _x = xprevious - sprite_width/2;
    var _y = yprevious - sprite_height/2;
    
    //mp_grid_clear_cell(global.mp_grid, xprevious div other.cell_size, yprevious div other.cell_size);
    mp_grid_clear_rectangle(global.mp_grid, _x div other.cell_size, _y div other.cell_size, (_x+sprite_width) div other.cell_size, (_y+sprite_height) div other.cell_size);
    
    //mp_grid_add_instances(global.mp_grid, self, false);
}*/