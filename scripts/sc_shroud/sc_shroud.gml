
#macro DEFAULT_SHROUD_ALPHA 1
#macro FOG_ALPHA 0.9
#macro SHROUD_ALWAYS_VISIBLE -1

function shroud_clear_grid_setup(_sight_radius, _grid_size, _no_shroud_value = 0, _see_max_shroud_value = 0.9, _max_shroud_value = DEFAULT_SHROUD_ALPHA)
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
                _temp_grid[# _x, _y] = _no_shroud_value;
            } else if (_dist <= _sight_radius) {
                _temp_grid[# _x, _y] = (_see_max_shroud_value * power((_dist/_sight_radius), 3));
            } else {
                _temp_grid[# _x, _y] = _max_shroud_value;
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
    
    //check along line halving the distance every time, searching for the first collider (nearest to begin)
    
    while (line_length >= stepDist) {
        _cnt++;
 
        half_point_x = begin_point_x + lengthdir_x(line_length/2, dir);
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

global.do_clear_shroud_cell_check_num = 0;
function do_clear_shroud_cell(_current_sgrid_x, _current_sgrid_y, _current_cgrid_x, _current_cgrid_y, _sgrid_width, _sgrid_height, _half_tile_grid_size, shroud_clear_mask_grid, _tilemap,
                            posX, posY, _nudge_amount)
{
    if (_current_sgrid_x < 0 || _current_sgrid_x >= _sgrid_width ||
        _current_sgrid_y < 0 || _current_sgrid_y >= _sgrid_height) {
        return false;
    }
    
    /*if (obj_shroud.shroud_grid[# _current_sgrid_x, _current_sgrid_y] < 0) {
        return {
            checkNum: 0,
            cleared: false
        };
    }*/
    
    var _cleared = false;
    
    var _shroud_clear_mask_value = shroud_clear_mask_grid[# _current_cgrid_x, _current_cgrid_y];
    if (_shroud_clear_mask_value < DEFAULT_SHROUD_ALPHA) {
        var _realX = (_current_sgrid_x * obj_shroud.grid_size) + _half_tile_grid_size-0.5;//center of tile
        var _realY = (_current_sgrid_y * obj_shroud.grid_size) + _half_tile_grid_size-0.5;//center of tile
        
        var do_clear_shroud = false;
        
        if (check_vision(posX, posY, _realX, _realY, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
            ++global.do_clear_shroud_cell_check_num;
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
                ++global.do_clear_shroud_cell_check_num;
                do_clear_shroud = true;
            }
            if (checkRight && !do_clear_shroud && check_vision(posX, posY, _realX + _nudge_amount, _realY, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
                ++global.do_clear_shroud_cell_check_num;
                do_clear_shroud = true;
            }
            if (checkTop && !do_clear_shroud && check_vision(posX, posY, _realX, _realY - _nudge_amount, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
                ++global.do_clear_shroud_cell_check_num;
                do_clear_shroud = true;
            }
            if (checkBottom && !do_clear_shroud && check_vision(posX, posY, _realX, _realY + _nudge_amount, _realX, _realY, _current_sgrid_x, _current_sgrid_y, _tilemap, _half_tile_grid_size)) {
                ++global.do_clear_shroud_cell_check_num;
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
    return _cleared;
}

function iterate_bfs(cx, cy, radius, _tilemap, shroud_clear_mask_grid)
{
    //show_debug_message($"iterate_bfs({cx}, {cy}, {radius}, ..., ...)");
    var _orig_x_grid = cx div obj_shroud.grid_size;
    var _orig_y_grid = cy div obj_shroud.grid_size;
    
    var _max_clear_grid_cells = obj_shroud.clear_grid_size * obj_shroud.clear_grid_size;
    
    var _clear_grid_half_size = obj_shroud.clear_grid_size div 2;
    var _sgrid_clear_topleft_x = _orig_x_grid - _clear_grid_half_size;
    var _sgrid_clear_topleft_y = _orig_y_grid - _clear_grid_half_size;
    
    var _sgrid_width = ds_grid_width(obj_shroud.shroud_grid);
    var _sgrid_height = ds_grid_height(obj_shroud.shroud_grid);
    var _half_tile_grid_size = (obj_shroud.grid_size / 2);
    
    var _nudge_amount = (_clear_grid_half_size+1);
    
    var _tile_size = 16;
    var _grid_ratio = _tile_size / obj_shroud.grid_size;
    
    ds_list_clear(obj_shroud.debug_bfs_list);
    obj_shroud.debug_bfs_max_dist = 0;
    
    //var visited = ds_map_create();        // to keep track of visited cells
    var _visited = init_visisted(obj_shroud.clear_grid_size);
    var queue   = ds_queue_create();
    
    //var radius2 = radius*1.41;

    // enqueue starting point in clear grid coordinates (-radius,radius)
    ds_queue_enqueue(queue, [_clear_grid_half_size, _clear_grid_half_size, 0]);
    var _queue_count = 1;

    var _expand_count = 0;
    while (_queue_count > 0) {
        var current = ds_queue_dequeue(queue);
        --_queue_count;
        
        var _clear_x = current[0];
        var _clear_y = current[1];
        
        if (get_visited(_visited, _clear_x, _clear_y) <= current[2]) {
            continue;
        }
        // mark visited
        store_visited(_visited, _clear_x, _clear_y, current[2]);
        
        if(obj_shroud.debug_level > 0) {
            if (obj_shroud.debug_bfs_max_dist < current[2]) {
                obj_shroud.debug_bfs_max_dist = current[2];
            }
        }
        
        var _sgrid_x = (_sgrid_clear_topleft_x + current[0]);
        var _sgrid_y = (_sgrid_clear_topleft_y + current[1]);
        
        if(obj_shroud.debug_level > 0) {
            ds_list_add(obj_shroud.debug_bfs_list, [_sgrid_x*obj_shroud.grid_size, _sgrid_y*obj_shroud.grid_size, current[2]]);
        }
            
        ++_expand_count;
        if (_expand_count > _max_clear_grid_cells) {
            show_debug_message(" Exiting on max extend");
            break;
        }
            
        if (current[2] > radius) continue;
        
        var _shroud_clear_mask_value = shroud_clear_mask_grid[# _clear_x, _clear_y];
        var _res = do_clear_shroud_cell(_sgrid_x, _sgrid_y, _clear_x, _clear_y, _sgrid_width, _sgrid_height, _half_tile_grid_size, shroud_clear_mask_grid, _tilemap, cx, cy, _nudge_amount);  

        if (_shroud_clear_mask_value == DEFAULT_SHROUD_ALPHA) {
            continue;
        } else if (is_blocking(_sgrid_x, _sgrid_y, _tilemap, obj_shroud.grid_size)) {
            if (_res && _grid_ratio != 1) {
                var _dx = ((_sgrid_x * obj_shroud.grid_size) mod _tile_size) / obj_shroud.grid_size;
                var _dy = ((_sgrid_y * obj_shroud.grid_size) mod _tile_size) / obj_shroud.grid_size;
                
                var _base_y = _sgrid_y - _dy;
                for (var _i = 0; _i < _grid_ratio; ++_i)
                {
                    if (obj_shroud.shroud_grid[# _sgrid_x, _base_y + _i ] > _shroud_clear_mask_value) {
                        obj_shroud.shroud_grid[# _sgrid_x, _base_y + _i ] = _shroud_clear_mask_value;
                        var _ny = _clear_y - _dy + _i;
                        if (_ny >= 0 && _ny < obj_shroud.clear_grid_size) {
                            store_visited(_visited, _clear_x, _ny, current[2]);
                        }
                    }
                }
            }
            continue;
        }
        // enqueue neighbors (Manhattan directions)
        if (current[0] + 1 < obj_shroud.clear_grid_size && 
            get_visited(_visited, current[0] + 1, current[1]) > current[2]+1) {
            ds_queue_enqueue(queue, [current[0] + 1, current[1], current[2]+1]);
            ++_queue_count;
        }
        if (current[0] - 1 >= 0 && 
            get_visited(_visited, current[0] - 1, current[1]) > current[2]+1) {
            ds_queue_enqueue(queue, [current[0] - 1, current[1], current[2]+1]);
            ++_queue_count;
        }
        if (current[1] + 1 < obj_shroud.clear_grid_size &&
            get_visited(_visited, current[0], current[1] + 1) > current[2]+1) {
            ds_queue_enqueue(queue, [current[0], current[1] + 1, current[2]+1]);
            ++_queue_count;
        }
        if (current[1] - 1 >= 0 &&
            get_visited(_visited, current[0], current[1] - 1) > current[2]+1) {
            ds_queue_enqueue(queue, [current[0], current[1] - 1, current[2]+1]);
            ++_queue_count;
        }
        if (current[0] + 1 < obj_shroud.clear_grid_size && current[1] + 1 < obj_shroud.clear_grid_size &&
            get_visited(_visited, current[0] + 1, current[1] + 1) > current[2]+1.414) {
            ds_queue_enqueue(queue, [current[0] + 1, current[1] + 1, current[2]+1.414]);
            ++_queue_count;
        }
        if (current[0] + 1 < obj_shroud.clear_grid_size && current[1] - 1 >= 0 &&
            get_visited(_visited, current[0] + 1, current[1] - 1) > current[2]+1.414) {
            ds_queue_enqueue(queue, [current[0] + 1, current[1] - 1, current[2]+1.414]);
            ++_queue_count;
        }
        if (current[0] - 1 >= 0 && current[1] + 1 < obj_shroud.clear_grid_size &&
            get_visited(_visited, current[0] - 1, current[1] + 1) > current[2]+1.414) {
            ds_queue_enqueue(queue, [current[0] - 1, current[1] + 1, current[2]+1.414]);
            ++_queue_count;
        }
        if (current[0] - 1 >= 0 && current[1] - 1 >= 0 &&
            get_visited(_visited, current[0] - 1, current[1] - 1) > current[2]+1.414) {
            ds_queue_enqueue(queue, [current[0] - 1, current[1] - 1, current[2]+1.414]);
            ++_queue_count;
        }

    }

    ds_queue_destroy(queue);
    delete_visited(_visited);

    //show_debug_message($"Expanded {_expand_count} times, checked {global.do_clear_shroud_cell_check_num} times");
}

//global.shroud_visited_last_size = 1;
function init_visisted(_size)
{
    var _visited = ds_grid_create(_size, _size);
    ds_grid_clear(_visited, _size / 2);
    return _visited;
    /*var _visited = array_create(_size*_size, _size/2);
    global.shroud_visited_last_size = _size;
    return _visited;*/
}

function delete_visited(_visited)
{
    ds_grid_destroy(_visited);
}

function get_visited(_visited, _x, _y)
{
    return _visited[#_x, _y];
    /*var _i = _x * global.shroud_visited_last_size + _y;
    return _visited[_i];*/
}

function store_visited(_visited, _x, _y, _val)
{
    _visited[# _x, _y] = _val;
    /*var _i = _x * global.shroud_visited_last_size + _y;
    _visited[_i] = _val;*/
}

// helper: check if tile blocks
function is_blocking(_x, _y, tilemap_array, grid_size) {
    for (var i = 0; i < array_length(tilemap_array); i++) {
        var tmap = tilemap_array[i];
        if (tilemap_get_at_pixel(tmap, _x * grid_size, _y * grid_size) > 0) {
            return true;
        }
    }
    return false;
}

/// @function Clear a portion of shroud around a point
/// @param {Real}   posX  X coordinate of center of clear shroud
/// @param {Real}   posY  Y coordinate of center of clear shroud
function shroud_clear_position(posX, posY, _tilemap, shroud_clear_mask_grid){
    
    global.do_clear_shroud_cell_check_num = 0;
    ds_list_clear(obj_shroud.debug_list);
    ds_list_clear(obj_shroud.debug_points);
    obj_shroud.debug_find_collider_count = 0;
    obj_shroud.debug_find_collider_iteration = 0;
    
    var _cg_width = obj_shroud.clear_grid_size;
   
    iterate_bfs(posX, posY, _cg_width / 2, _tilemap, shroud_clear_mask_grid);
  
    //show_debug_message($"shroud_clear_position({posX}, {posY}, ...)");
    /*var _orig_x_grid = posX div obj_shroud.grid_size;
    var _orig_y_grid = posY div obj_shroud.grid_size;
    
    var _clear_grid_half_size = obj_shroud.clear_grid_size div 2;
    var _sgrid_clear_topleft_x = _orig_x_grid - _clear_grid_half_size;
    var _sgrid_clear_topleft_y = _orig_y_grid - _clear_grid_half_size;
    
    //show_debug_message($"sgrid=({_sgrid_clear_topleft_x}, {_sgrid_clear_topleft_y})");
    
    var _nudge_amount = (_clear_grid_half_size+1);
    
    var _half_tile_grid_size = (obj_shroud.grid_size / 2); 
   
    for (var _x = 0; _x < ds_grid_width(shroud_clear_mask_grid); _x++)
    {
        for (var _y = 0; _y < ds_grid_height(shroud_clear_mask_grid); _y++)
        {
            var _current_sgrid_x = (_sgrid_clear_topleft_x + _x);
            var _current_sgrid_y = (_sgrid_clear_topleft_y + _y);
            var _res = do_clear_shroud_cell(_current_sgrid_x, _current_sgrid_y, _x, _y, obj_shroud.shroud_grid_width, obj_shroud.shroud_grid_height, _half_tile_grid_size, shroud_clear_mask_grid, _tilemap, posX, posY, _nudge_amount);  
        }
    }
        
    show_debug_message("Checks: {0}", global.do_clear_shroud_cell_check_num);*/

}

function shroud_clear_area(_topLeft, _bottomRight)
{
    
    for (var _x = _topLeft.x; _x <= _bottomRight.x; ++_x)
    {
        var _sx = _x div obj_shroud.grid_size;
        for (var _y = _topLeft.y; _y <= _bottomRight.y; ++_y)
        {
            var _sy = _y div obj_shroud.grid_size;
            obj_shroud.shroud_grid[#_sx,_sy] = SHROUD_ALWAYS_VISIBLE;
        }
    }
}

function shroud_set_fog(){
    
    var _sgrid_width = ds_grid_width(obj_shroud.shroud_grid);
    var _sgrid_height = ds_grid_height(obj_shroud.shroud_grid);
    for (var _r = 0; _r < _sgrid_width; _r++)
    {
        for (var _c = 0; _c < _sgrid_height; _c++)
        {
            if (obj_shroud.shroud_grid[#_r, _c] < FOG_ALPHA &&
                obj_shroud.shroud_grid[#_r, _c] >= 0) {
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
            
            if (obj_shroud.shroud_grid[#_r, _c] < FOG_ALPHA &&
                obj_shroud.shroud_grid[#_r, _c] >= 0) {
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