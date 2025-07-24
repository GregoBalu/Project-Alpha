
#macro DEFAULT_SHROUD_ALPHA 1
#macro FOG_ALPHA 0.9

function shroud_clear_grid_setup(_sight_radius, _grid_size)
{
    if (_grid_size % 2 == 0) _grid_size++;
        
    var _temp_grid = ds_grid_create(_grid_size, _grid_size);
    
    var _cent = _grid_size div 2;
    
    if (_sight_radius > (_cent+1)) _sight_radius = _cent+1;
    
    //show_debug_message("clear shroud mask {0}x{0}, r={1}", _grid_size, _sight_radius);
    for (var _x = 0; _x < _grid_size; _x++)
    {
        //var debug_row = "";
        for (var _y = 0; _y < _grid_size; _y++)
        {
            var _dist = point_distance(_cent, _cent, _x, _y);
            if (_dist == 0) {
                _temp_grid[# _x, _y] = 0;
            } else if (_dist <= _sight_radius) {
                _temp_grid[# _x, _y] = (0.9 * power((_dist/_sight_radius), 3));
            } else {
                _temp_grid[# _x, _y] = DEFAULT_SHROUD_ALPHA;
            }
            //debug_row = string_concat(debug_row, " ", string_format(_temp_grid[# _x, _y], 2, 2) );
        }
        //show_debug_message(debug_row);
    }
    
    return _temp_grid;
}

/**
 * Function Description
 * @param {real} _sight_radius Description
 * @param {real} _grid_size Description
 * @param {Enum.Orientation} _orientation Description
 * @returns {Id.DsGrid<Real>} Clear grid mask
 */
function shroud_clear_grid_setup_blocked(_sight_radius, _grid_size, _orientation)
{
    if (_grid_size % 2 == 0) _grid_size++;
        
    var _temp_grid = ds_grid_create(_grid_size, _grid_size);
    
    var _half_grid = _grid_size div 2;
    var _cent = _half_grid;
    
    if (_sight_radius > (_cent+1)) _sight_radius = _cent+1;
        
    var _blocking_triangle;
    if (_orientation == Orientation.RIGHT) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent+_half_grid+1, _cent-_half_grid-1), 
                                            new Vec2(_cent+_half_grid+1, _cent+_half_grid+1) );
    } else if (_orientation == Orientation.DOWNRIGHT) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent+_grid_size, _cent), 
                                            new Vec2(_cent, _cent+_grid_size) );
    } else if (_orientation == Orientation.DOWN) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent+_half_grid+1, _cent+_half_grid+1), 
                                            new Vec2(_cent-_half_grid-1, _cent+_half_grid+1) );
    } else if (_orientation == Orientation.DOWNLEFT) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent-_grid_size, _cent), 
                                            new Vec2(_cent, _cent+_grid_size) );
    } else if (_orientation == Orientation.LEFT) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent-_half_grid-1, _cent-_half_grid-1), 
                                            new Vec2(_cent-_half_grid-1, _cent+_half_grid+1) );
    } else if (_orientation == Orientation.UPLEFT) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent, _cent-_grid_size), 
                                            new Vec2(_cent-_grid_size, _cent) );
    } else if (_orientation == Orientation.UP) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent-_half_grid-1, _cent-_half_grid-1), 
                                            new Vec2(_cent+_half_grid+1, _cent-_half_grid-1) );
    } else if (_orientation == Orientation.UPRIGHT) {
        _blocking_triangle = new Triangle(  new Vec2(_cent, _cent), 
                                            new Vec2(_cent+_grid_size, _cent), 
                                            new Vec2(_cent, _cent-_grid_size) );
    } else {
        return shroud_clear_grid_setup(_sight_radius, _grid_size);
    }
    //TODO
    
    //show_debug_message("clear shroud mask {0}x{0}, r={1}", _grid_size, _sight_radius);
    for (var _x = 0; _x < _grid_size; _x++)
    {
        //var debug_row = "";
        for (var _y = 0; _y < _grid_size; _y++)
        {
            var _dist = point_distance(_cent, _cent, _x, _y);
            if (_dist == 0) {
                _temp_grid[# _x, _y] = 0;
            } else if (_dist <= _sight_radius) {
                if (_blocking_triangle.is_point_in(new Vec2(_x, _y))) {
                    _temp_grid[# _x, _y] = DEFAULT_SHROUD_ALPHA;
                } else {
                    _temp_grid[# _x, _y] = (0.9 * power((_dist/_sight_radius), 3));
                }
            } else {
                _temp_grid[# _x, _y] = DEFAULT_SHROUD_ALPHA;
            }
            //debug_row = string_concat(debug_row, " ", string_format(_temp_grid[# _x, _y], 2, 2) );
        }
        //show_debug_message(debug_row);
    }
    
    _blocking_triangle.cleanup();
    delete _blocking_triangle;
    
    return _temp_grid;
}

function find_collider(startX, startY, endX, endY, stepDist, _tilemap){
    //Establish direction and max distance to raycast
    var dir = point_direction(startX, startY, endX, endY);
    var line_length = point_distance(startX, startY, endX, endY);
    
    var _cnt = 0;
    
    //var step = max_len / stepDist;
    //show_debug_message("step={0}", stepDist);

    var begin_point_x = startX;
    var begin_point_y = startY;
    
    var end_point_x = endX;
    var end_point_y = endY;
    
    var half_point_x = endX;
    var half_point_y = endY;
    
    while (line_length >= stepDist) {
        _cnt++;
 
        half_point_x = begin_point_x + lengthdir_x(line_length/2, dir)
        half_point_y = begin_point_y + lengthdir_y(line_length/2, dir);

        if (collision_line(begin_point_x, begin_point_y, half_point_x, half_point_y, _tilemap, false, true) != noone) {
            if (collision_line(half_point_x, half_point_y, end_point_x, end_point_y, _tilemap, false, true) != noone) {
                if (collision_circle(half_point_x, half_point_y, 2, _tilemap, false, true) == noone) {
                    if (obj_shroud.debug_level>0) {
                        obj_shroud.debug_find_collider_count++;
                        obj_shroud.debug_find_collider_iteration += _cnt;
                    }
                    //show_debug_message($"Found no collider in {_cnt} steps");
                    return noone;
                } else {
                    if (obj_shroud.debug_level>0) {
                        obj_shroud.debug_find_collider_count++;
                        obj_shroud.debug_find_collider_iteration += _cnt;
                    }
                    //show_debug_message($"Found collider in {_cnt} steps");
                    return [half_point_x,half_point_y];
                }
            } else {
                end_point_x = half_point_x;
                end_point_y = half_point_y;
            }
            
        } else {
            begin_point_x = half_point_x;
            begin_point_y = half_point_y;
        }
        line_length = point_distance(begin_point_x, begin_point_y, end_point_x, end_point_y);
    }
    //show_debug_message($"Found collider in {_cnt} steps");

    if (obj_shroud.debug_level>0) {
        obj_shroud.debug_find_collider_count++;
        obj_shroud.debug_find_collider_iteration += _cnt;
    }
    return [begin_point_x,begin_point_y];
}

function check_vision(startX, startY, endX, endY, origEndX, origEndY, endGlobalGridX, endGlobalGridY, _tilemap, _half_grid_size) {
    
    var _collide_line_id = collision_line(startX, startY, endX, endY, _tilemap, false, true);
    //var _collide_line_id = collision_rectangle(x1pos, y2pos, x2pos, y2pos, _tilemap, false, true);
    if (_collide_line_id == noone) {
        if (obj_shroud.debug_level > 0) {
            var debug_data = {
                visible : true,
                has_collision : false,
                has_collider : false,
                start_x : startX,
                start_y : startY,
                end_x : endX,
                end_y : endY,
                orig_end_x : origEndX,
                orig_end_y : origEndY
            };
            ds_list_add(obj_shroud.debug_list, debug_data);
        }
        return true;
    } else {
        var coll = find_collider(startX, startY, endX, endY, _half_grid_size -0.5, _tilemap);
        if (coll == noone) {
            return false;
        }
        
        //calc grid, cuz collider might be on edge
        var _c_x = coll[0] div obj_shroud.grid_size;
        var _c_y = coll[1] div obj_shroud.grid_size;
     
        if (_c_x == endGlobalGridX && _c_y == endGlobalGridY) {
            if (obj_shroud.debug_level > 0) {
                var debug_data = {
                    visible : true,
                    has_collision : true,
                    has_collider : true,
                    start_x : startX,
                    start_y : startY,
                    coll_x : coll[0],
                    coll_y : coll[1],
                    end_x : endX,
                    end_y : endY,
                    orig_end_x : origEndX,
                    orig_end_y : origEndY
                };
                ds_list_add(obj_shroud.debug_list, debug_data);
            }
            return true;
        } else {
            if (obj_shroud.debug_level > 0) {
                var debug_data = {
                    visible : false,
                    has_collision : true,
                    has_collider : false,
                    start_x : startX,
                    start_y : startY,
                    coll_x : coll[0],
                    coll_y : coll[1],
                    end_x : endX,
                    end_y : endY,
                    orig_end_x : origEndX,
                    orig_end_y : origEndY
                };
                ds_list_add(obj_shroud.debug_list, debug_data);
            }
        }
    }
    
    return false;
}

/*function loop_spiral(width, height, func) {
    var _x = 0;
    var _y = 0;
    var _dx = 0;
    var _dy = -1;
    var _end = power(max(width, height), 2);
    for (var i = 0; i < _end; i++) 
    {
        if (-width/2 < x <= width/2) and (-height/2 < y <= height/2) {
            //do stuff
            func(x, y);
        }
        if (x == y or (x < 0 and x == -y) or (x > 0 and x == 1-y) ) {
            dx = -dy;
            dy = dx;
        }
        x = x+dx; 
        y = y+dy;
    }
}*/

function do_clear_shroud_cell(_current_sgrid_x, _current_sgrid_y, _current_cgrid_x, _current_cgrid_y, _sgrid_width, _sgrid_height, _half_tile_grid_size, shroud_clear_mask_grid, _tilemap,
                            posX, posY, _nudge_amount)
{
    if (_current_sgrid_x < 0 || _current_sgrid_x >= _sgrid_width ||
        _current_sgrid_y < 0 || _current_sgrid_y >= _sgrid_height) {
        return {
                checkNum: 0,
                cleared: false    
            };
    }
    
    var _checkNum = 0;
    var _cleared = false;
    
    var _shroud_clear_mask_value = shroud_clear_mask_grid[# _current_cgrid_x, _current_cgrid_y];
    if (_shroud_clear_mask_value < DEFAULT_SHROUD_ALPHA) {
        var _realX = (_current_sgrid_x * obj_shroud.grid_size) + _half_tile_grid_size-0.5;//center of tile
        var _realY = (_current_sgrid_y * obj_shroud.grid_size) + _half_tile_grid_size-0.5;//center of tile
        
        var do_clear_shroud = false;
        
        if (check_vision(posX, posY, _realX, _realY, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
            ++_checkNum;
            do_clear_shroud = true;
        }
        
        if (!do_clear_shroud) {
            var dx = (posX - _realX);
            var dy = (posY - _realY);
            var checkLeft = false;
            var checkRight = false;
            var checkTop = false;
            var checkBottom = false;
            
            if (dx <= -_half_tile_grid_size) {
                //I'm left
                checkLeft = true;
            } else if (dx >= _half_tile_grid_size) {
                //I'm right
                checkRight = true;
            }
            if (dy <= -_half_tile_grid_size) {
                //I'm above
                checkTop = true;
            } else if (dy >= _half_tile_grid_size) {
                //I'm below
                checkBottom = true;
            }
            
            //if (abs(dx) > abs(dy)) 
            if (checkLeft && !do_clear_shroud && check_vision(posX, posY, _realX - _nudge_amount, _realY, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
                ++_checkNum;
                do_clear_shroud = true;
            }
            if (checkRight && !do_clear_shroud && check_vision(posX, posY, _realX + _nudge_amount, _realY, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
                ++_checkNum;
                do_clear_shroud = true;
            }
            if (checkTop && !do_clear_shroud && check_vision(posX, posY, _realX, _realY - _nudge_amount, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
                ++_checkNum;
                do_clear_shroud = true;
            }
            if (checkBottom && !do_clear_shroud && check_vision(posX, posY, _realX, _realY + _nudge_amount, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
                ++_checkNum;
                do_clear_shroud = true;
            }
        }
        
        if (do_clear_shroud) {
            obj_shroud.shroud_grid[# _current_sgrid_x, _current_sgrid_y] = _shroud_clear_mask_value;
            _cleared = true;
            //obj_shroud.shroud_grid[# globalGridX, globalGridY].debug = string_concat(_x, ",", _y, "\n", _shroud_clear_mask_value);
            //show_debug_message($"Shroud [{_current_sgrid_x},{_current_sgrid_y}]={_shroud_clear_mask_value}");
        }
        //obj_shroud.shroud_grid[# globalGridX, globalGridY].checked = true;
    }
    return {
                checkNum: _checkNum,
                cleared: _cleared
            };
}

function isPointValid(_x, _y) {
    return _x >= 0 && _x < obj_shroud.clear_grid_size && _y >= 0 && _y < obj_shroud.clear_grid_size;
}

function checkPointBlocked(_x, _y, _grid) {
    return (_grid[#_x, _y] == 1);
};

/// @function Clear a portion of shroud around a point
/// @param {Real}   posX  X coordinate of center of clear shroud
/// @param {Real}   posY  Y coordinate of center of clear shroud
function shroud_clear_position(posX, posY, _tilemap, shroud_clear_mask_grid){
    //show_debug_message($"shroud_clear_position({posX}, {posY}, ...)");
    var _orig_x_grid = posX div obj_shroud.grid_size;
    var _orig_y_grid = posY div obj_shroud.grid_size;
    
    var _clear_grid_half_size = obj_shroud.clear_grid_size div 2;
    var _sgrid_clear_topleft_x = _orig_x_grid - _clear_grid_half_size;
    var _sgrid_clear_topleft_y = _orig_y_grid - _clear_grid_half_size;
    
    //show_debug_message($"sgrid=({_sgrid_clear_topleft_x}, {_sgrid_clear_topleft_y})");
    
    var checkNum = 0;
    ds_list_clear(obj_shroud.debug_list);
    ds_list_clear(obj_shroud.debug_points);
    obj_shroud.debug_find_collider_count = 0;
    obj_shroud.debug_find_collider_iteration = 0;
    
    var _nudge_amount = (_clear_grid_half_size+1);
    
    var _half_tile_grid_size = (obj_shroud.grid_size / 2);
    
    var _sgrid_width = ds_grid_width(obj_shroud.shroud_grid);
    var _sgrid_height = ds_grid_height(obj_shroud.shroud_grid);
    
    var doSpiral = false;
    
    if (doSpiral) {
        //Spiral traverse of clear_grid on shroud_grid, inside out
        // (di, dj) is a vector - direction in which we move right now
        var _dx = 1;
        var _dy = 0;
        // length of current segment
        var segment_length = 1;
    
        // current position (i, j) and how much of current segment we passed
        var _current_sgrid_x = _orig_x_grid;
        var _current_sgrid_y = _orig_y_grid;
        var _current_cgrid_x = _clear_grid_half_size;
        var _current_cgrid_y = _clear_grid_half_size;
        
        var _tmp_grid = ds_grid_create(obj_shroud.clear_grid_size, obj_shroud.clear_grid_size);
        ds_grid_clear(_tmp_grid, 0);//0 not checked, 1 checked not cleared, 2 checked cleared
        
        var _early_opt = 0;
        
        var segment_passed = 0;
        var NUMBER_OF_POINTS = power(obj_shroud.clear_grid_size, 2);
        for (var k = 0; k < NUMBER_OF_POINTS; ++k) {
            //do sth here
            //_tmp_grid[#_current_cgrid_x, _current_cgrid_y] = 0;//0 not checked, 1 checked not cleared, 2 checked cleared
            var _need_check = true;
            var _clen = point_distance(_current_cgrid_x, _current_cgrid_y, _clear_grid_half_size, _clear_grid_half_size);
            if (_clen > 1) {
                var _dh = _clear_grid_half_size - _current_cgrid_x; //vector of horizontal distance from current grid
                var _dv = _clear_grid_half_size - _current_cgrid_y; //vector of vertical distance from current grid
                
                var _neighbour1_x = -1;
                var _neighbour1_y = -1;
                var _neighbour2_x = -1;
                var _neighbour2_y = -1;
                var _neighbour3_x = -1;
                var _neighbour3_y = -1;
                if (_dh == 0) {
                    _neighbour1_x = _current_cgrid_x -1;
                    _neighbour1_y = _current_cgrid_y;
                    _neighbour2_x = _current_cgrid_x +1;
                    _neighbour2_y = _current_cgrid_y;
                    _neighbour3_x = _current_cgrid_x;
                    _neighbour3_y = _current_cgrid_y + sign(_dv);
                } else if (_dv == 0) {
                    _neighbour1_x = _current_cgrid_x;
                    _neighbour1_y = _current_cgrid_y+1;
                    _neighbour2_x = _current_cgrid_x;
                    _neighbour2_y = _current_cgrid_y-1;
                    _neighbour3_x = _current_cgrid_x + sign(_dh);
                    _neighbour3_y = _current_cgrid_y;
                } else {
                    _neighbour1_x = _current_cgrid_x + sign(_dh);
                    _neighbour1_y = _current_cgrid_y;
                    _neighbour2_x = _current_cgrid_x;
                    _neighbour2_y = _current_cgrid_y + sign(_dv);
                }
                
                var _res = true;
                if (isPointValid(_neighbour1_x, _neighbour1_y)) {
                    _res = _res && checkPointBlocked(_neighbour1_x, _neighbour1_y, _tmp_grid);
                }
                if (_res && isPointValid(_neighbour2_x, _neighbour2_y)) {
                    _res = _res && checkPointBlocked(_neighbour2_x, _neighbour2_y, _tmp_grid);
                }
                if (_res && isPointValid(_neighbour3_x, _neighbour3_y)) {
                    _res = _res && checkPointBlocked(_neighbour3_x, _neighbour3_y, _tmp_grid);
                }
                
                if (_res) {
                    _tmp_grid[# _current_cgrid_x, _current_cgrid_y] = 1;
                    _early_opt++;
                    _need_check = false;
                }
                
                /*var _cdir = point_direction(_current_cgrid_x, _current_cgrid_y, _clear_grid_half_size, _clear_grid_half_size);
                var _tmp_x = floor(_current_cgrid_x + sign(lengthdir_x(1, _cdir)) );
                var _tmp_y = floor(_current_cgrid_y + sign(lengthdir_y(1, _cdir)) );*/
                
                //show_debug_message($"Checking ({_current_cgrid_x},{_current_cgrid_y}) -> ({_tmp_x},{_tmp_y}) : {_tmp_grid[# _tmp_x, _tmp_y]}");
                /*if (_tmp_grid[# _tmp_x, _tmp_y] == 1) {
                    _tmp_grid[# _current_cgrid_x, _current_cgrid_y] = 1;
                    //show_debug_message($"Optimization!");
                    _need_check = false;
                }*/
            } 
            if (_need_check) {
                var res = do_clear_shroud_cell(_current_sgrid_x, _current_sgrid_y, _current_cgrid_x, _current_cgrid_y, _sgrid_width, _sgrid_height, _half_tile_grid_size, shroud_clear_mask_grid, _tilemap, posX, posY, _nudge_amount);
                checkNum += res.checkNum;
                _tmp_grid[# _current_cgrid_x, _current_cgrid_y] = res.cleared?2:1;
            }
            
            // make a step, add 'direction' vector (di, dj) to current position (i, j)
            _current_sgrid_x += _dx;
            _current_sgrid_y += _dy;
            _current_cgrid_x += _dx;
            _current_cgrid_y += _dy;
            
            ++segment_passed;
            
            if (segment_passed == segment_length) {
                // done with current segment
                segment_passed = 0;
    
                // 'rotate' directions
                var buffer = _dx;
                _dx = -_dy;
                _dy = buffer;
    
                // increase segment length if necessary
                if (_dy == 0) {
                    ++segment_length;
                }
            }
        }
        
        ds_grid_destroy(_tmp_grid);
        //show_debug_message($"Checked {NUMBER_OF_POINTS}, early opt: {_early_opt}");
    } else {
        for (var _x = 0; _x < obj_shroud.clear_grid_size; _x++)
        {
            for (var _y = 0; _y < obj_shroud.clear_grid_size; _y++)
            {
                var _current_sgrid_x = (_sgrid_clear_topleft_x + _x);
                var _current_sgrid_y = (_sgrid_clear_topleft_y + _y);
                var _res = do_clear_shroud_cell(_current_sgrid_x, _current_sgrid_y, _x, _y, _sgrid_width, _sgrid_height, _half_tile_grid_size, shroud_clear_mask_grid, _tilemap, posX, posY, _nudge_amount);  
                checkNum += _res.checkNum;
            }
        }
        
        //show_debug_message("Checks: {0}", checkNum);
    }
}

function shroud_set_fog(){
    
    var _sgrid_width = ds_grid_width(obj_shroud.shroud_grid);
    var _sgrid_height = ds_grid_height(obj_shroud.shroud_grid);
    for (var _r = 0; _r < _sgrid_width; _r++)
    {
        for (var _c = 0; _c < _sgrid_height; _c++)
        {
            if (obj_shroud.shroud_grid[#_r, _c] < FOG_ALPHA) {
                obj_shroud.shroud_grid[#_r, _c] = FOG_ALPHA;
            }
            //obj_shroud.shroud_grid[#_r, _c].checked = false;
            //obj_shroud.shroud_grid[#_r, _c].debug = "";
        }
    }
}

function shroud_set_fog_around(_x, _y, _range){
    
    var _x_grid = _x div obj_shroud.grid_size;
    var _y_grid = _y div obj_shroud.grid_size;
    var _range_grid = _range div obj_shroud.grid_size;
    
    var _sgrid_width = ds_grid_width(obj_shroud.shroud_grid);
    var _sgrid_height = ds_grid_height(obj_shroud.shroud_grid);
    
    for (var _r = max(0, _x_grid-_range_grid); _r < (_x_grid+_range_grid) && _r < _sgrid_width; _r++)
    {
        for (var _c = max(0, _y_grid-_range_grid); _c < (_y_grid+_range_grid) && _c < _sgrid_height; _c++)
        {
            
            if (obj_shroud.shroud_grid[#_r, _c] < FOG_ALPHA) {
                obj_shroud.shroud_grid[#_r, _c] = FOG_ALPHA;
            }
            //obj_shroud.shroud_grid[#_r, _c].checked = false;
            //obj_shroud.shroud_grid[#_r, _c].debug = "";
        }
    }
}

function shroud_add_fog()
{
    var _sgrid_width = ds_grid_width(obj_shroud.shroud_grid);
    var _sgrid_height = ds_grid_height(obj_shroud.shroud_grid);
    
    for (var _r = 0; _r < _sgrid_width; _r++)
    {
        for (var _c = 0; _c < _sgrid_height; _c++)
        {
            if (obj_shroud.shroud_grid[#_r, _c] < DEFAULT_SHROUD_ALPHA && obj_shroud.shroud_grid[#_r, _c] >= FOG_ALPHA) {
                obj_shroud.shroud_grid[#_r, _c] = clamp(obj_shroud.shroud_grid[#_r, _c] + (delta_time/10000000), 0, DEFAULT_SHROUD_ALPHA);
            }
        }
    }
}





/**/