
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
 * @param {Orientation} _orientation Description
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
    
    var begin_point = [startX, startY];
    var end_point = [endX, endY];
    var half_point = [endX, endY];
    while (line_length >= stepDist) {
        _cnt++;
        dir = point_direction(begin_point[0], begin_point[1], end_point[0], end_point[1]);
        half_point = [begin_point[0] + lengthdir_x(line_length/2, dir), begin_point[1] + lengthdir_y(line_length/2, dir)];
        //var colliderHalfWayId = collision_circle(half_point[0], half_point[1], 2, _tilemap, false, false);
        if (collision_line(begin_point[0], begin_point[1], half_point[0], half_point[1], _tilemap, true, true) != noone) {
            if (collision_line(half_point[0], half_point[1], end_point[0], end_point[1], _tilemap, true, true) != noone) {
                if (collision_circle(half_point[0], half_point[1], 2, _tilemap, true, true) == noone) {
                    return noone;
                } else {
                    return half_point;
                }
            } else {
                end_point = half_point;
            }
            
        } else {
            begin_point = half_point;
        }
        line_length = point_distance(begin_point[0], begin_point[1], end_point[0], end_point[1]);
    }
    
    //return end_point;
    return begin_point;
    
    //dir = point_direction(begin_point[0], begin_point[1], end_point[0], end_point[1]);
    //half_point = [begin_point[0] + lengthdir_x(line_length/2, dir), begin_point[1] + lengthdir_y(line_length/2, dir)];
    //return half_point;
    
    
    //Begin raycast loop
    /*var _cnt = 0;
    for(var len = 0; len <= max_len; len += stepDist) {
        ++_cnt;
        var castX = startX + lengthdir_x(len, dir);
        var castY = startY + lengthdir_y(len, dir);
        ds_list_add(obj_shroud.debug_points, {
            x : castX,
            y : castY
        });
        
        if(collision_circle(castX, castY, 2, _tilemap, true, true)) {
        //if (collision_point(castX, castY, _tilemap, false, true)) {
            show_debug_message("find_collider loop count: {0}", _cnt);
            hitpoint[0] = castX;
            hitpoint[1] = castY;
            return hitpoint;
        }
    }
    show_debug_message("find_collider loop count: {0}", _cnt);*/
    
    /*if(collision_point(endX, endY, _tilemap, false, true)) {
        hitpoint[0] = endX;
        hitpoint[1] = endY;
        return hitpoint;
    }*/
    
    //If the raycast hit nothing, return false
    return noone;
}

function check_vision(startX, startY, endX, endY, origEndX, origEndY, endGlobalGridX, endGlobalGridY, _tilemap, _half_grid_size) {
    
    var _collide_line_id = collision_line(startX, startY, endX, endY, _tilemap, false, true);
    //var _collide_line_id = collision_rectangle(x1pos, y2pos, x2pos, y2pos, _tilemap, false, true);
    if (_collide_line_id == noone) {
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
        return true;
    } else {
        /*var _collide_end_id = collision_point(endX, endY, _tilemap, true, false);
        if (_collide_end_id == noone) {
            //there is a collision, but not at the end
            var debug_data = {
                visible : false,
                has_collision : true,
                has_collider : false,
                start_x : startX,
                start_y : startY,
                end_x : endX,
                end_y : endY,
                orig_end_x : origEndX,
                orig_end_y : origEndY
            };
            ds_list_add(obj_shroud.debug_list, debug_data);
            return false;
        }*/
        
        var coll = find_collider(startX, startY, endX, endY, _half_grid_size -0.5, _tilemap);
        if (coll == noone) {
            return false;
        }
        /*if (coll == false) {
            if (showDebug(endX, endY)) {
                show_debug_message("check_vision: no collider");
            }
            var debug_data = {
                visible : true,
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
            return false;
        }*/
        
        //calc grid, cuz collider might be on edge
        var _c_x = coll[0] div obj_shroud.grid_size;
        var _c_y = coll[1] div obj_shroud.grid_size;
     
        if (_c_x == endGlobalGridX && _c_y == endGlobalGridY) {
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
            //ds_list_destroy(_check_points);
            return true;
        } else {
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

/// @function Clear a portion of shroud around a point
/// @param {Real}   posX  X coordinate of center of clear shroud
/// @param {Real}   posY  Y coordinate of center of clear shroud
function shroud_clear_position(posX, posY, _tilemap, shroud_clear_mask_grid){
    var _orig_x_grid = posX div obj_shroud.grid_size;
    var _orig_y_grid = posY div obj_shroud.grid_size;
    
    var _sx = _orig_x_grid;
    var _sy = _orig_y_grid;
    
    var _half_clear_grid = obj_shroud.clear_grid_size div 2;
    //show_debug_message("{0}", _half_clear_grid);
    
    _sx -= _half_clear_grid;
    _sy -= _half_clear_grid;
    
    var checkNum = 0;
    
    var _half_tile_grid_size = (obj_shroud.grid_size / 2);
    //show_debug_message("_half_tile_grid_size={0}", _half_tile_grid_size);
    ds_list_clear(obj_shroud.debug_list);
    ds_list_clear(obj_shroud.debug_points);
    
    for (var _x = 0; _x < obj_shroud.clear_grid_size; _x++)
    {
        for (var _y = 0; _y < obj_shroud.clear_grid_size; _y++)
        {
            var globalGridX = (_sx + _x);
            var globalGridY = (_sy + _y);
            if (globalGridX >= 0 && globalGridX < ds_grid_width(obj_shroud.shroud_grid) &&
                globalGridY >= 0 && globalGridY < ds_grid_height(obj_shroud.shroud_grid))
            {
            
                var _shroud_clear_mask_value = shroud_clear_mask_grid[# _x, _y];
                if (_shroud_clear_mask_value < DEFAULT_SHROUD_ALPHA) {
                    var _realX = (globalGridX * obj_shroud.grid_size) + _half_tile_grid_size-0.5;//center of tile
                    var _realY = (globalGridY * obj_shroud.grid_size) + _half_tile_grid_size-0.5;//center of tile
                    
                    /*var dir = point_direction(_realX, _realY, posX, posY);
                    var len = obj_shroud.grid_size;
                    var neighbour_x = _realX + lengthdir_x(len, dir);
                    var neighbour_y = _realY + lengthdir_y(len, dir);
                    var _neighbor_dist = point_distance(posX, posY, neighbour_x, neighbour_y);
                    var neighbour_grid_x = neighbour_x div obj_shroud.grid_size;
                    var neighbour_grid_y = neighbour_y div obj_shroud.grid_size;
                    if (_neighbor_dist > obj_shroud.grid_size && obj_shroud.shroud_grid[# neighbour_grid_x, neighbour_grid_y] == (FOG_ALPHA-0.01)) {
                        //not visible
                        continue;
                    }*/
                    
                    
                    var do_clear_shroud = false;
                    
                    var nudgedX = _realX;
                    var nudgedY = _realY;
                    
                    if (check_vision(posX, posY, nudgedX, nudgedY, _realX, _realY, globalGridX, globalGridY, _tilemap, _half_tile_grid_size)) {
                        ++checkNum;
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
                        
                        var nudge_amount = (_half_tile_grid_size+1);
                        
                        //if (abs(dx) > abs(dy)) 
                        if (checkLeft && !do_clear_shroud && check_vision(posX, posY, nudgedX - nudge_amount, nudgedY, _realX, _realY, (_sx + _x), (_sy + _y), _tilemap, _half_tile_grid_size)) {
                            ++checkNum;
                            do_clear_shroud = true;
                        }
                        if (checkRight && !do_clear_shroud && check_vision(posX, posY, nudgedX + nudge_amount, nudgedY, _realX, _realY, (_sx + _x), (_sy + _y), _tilemap, _half_tile_grid_size)) {
                            ++checkNum;
                            do_clear_shroud = true;
                        }
                        if (checkTop && !do_clear_shroud && check_vision(posX, posY, nudgedX, nudgedY - nudge_amount, _realX, _realY, (_sx + _x), (_sy + _y), _tilemap, _half_tile_grid_size)) {
                            ++checkNum;
                            do_clear_shroud = true;
                        }
                        if (checkBottom && !do_clear_shroud && check_vision(posX, posY, nudgedX, nudgedY + nudge_amount, _realX, _realY, (_sx + _x), (_sy + _y), _tilemap, _half_tile_grid_size)) {
                            ++checkNum;
                            do_clear_shroud = true;
                        }
                        
                        
                    }
                    
                    if (do_clear_shroud) {
                        obj_shroud.shroud_grid[# globalGridX, globalGridY] = _shroud_clear_mask_value;
                        //obj_shroud.shroud_grid[# globalGridX, globalGridY].debug = string_concat(_x, ",", _y, "\n", _shroud_clear_mask_value);
                        //show_debug_message("alpha: {0}, i: {1}", _shroud_clear_mask_value, i);
                    }
                    //obj_shroud.shroud_grid[# globalGridX, globalGridY].checked = true;
                }
            }   
        }
    }
    
    //show_debug_message("Checks: {0}", checkNum);
}

function shroud_set_fog(){
    
    for (var _r = 0; _r < ds_grid_width(obj_shroud.shroud_grid); _r++)
    {
        for (var _c = 0; _c < ds_grid_height(obj_shroud.shroud_grid); _c++)
        {
            if (obj_shroud.shroud_grid[#_r, _c] < FOG_ALPHA) {
                obj_shroud.shroud_grid[#_r, _c] = FOG_ALPHA;
            }
            //obj_shroud.shroud_grid[#_r, _c].checked = false;
            //obj_shroud.shroud_grid[#_r, _c].debug = "";
        }
    }
}

function shroud_add_fog(){
    for (var _r = 0; _r < ds_grid_width(obj_shroud.shroud_grid); _r++)
    {
        for (var _c = 0; _c < ds_grid_height(obj_shroud.shroud_grid); _c++)
        {
            if (obj_shroud.shroud_grid[#_r, _c] < DEFAULT_SHROUD_ALPHA && obj_shroud.shroud_grid[#_r, _c] >= FOG_ALPHA) {
                obj_shroud.shroud_grid[#_r, _c] = clamp(obj_shroud.shroud_grid[#_r, _c] + (delta_time/10000000), 0, DEFAULT_SHROUD_ALPHA);
            }
        }
    }
}





/**/