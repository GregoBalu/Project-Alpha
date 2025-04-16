



/**
 * Function Description
 * @param {Asset.GMSprite} _sprite Description
 * @param {real} _x Description
 * @param {real} _y Description
 * @param {real} _w Description
 * @param {real} _h Description
 * @param {real} _depth Description
 * @param {real} _dir Description
 * @param {real} _speed Description
 * @param {real} _life_seconds Description
 * @param {Asset.GMSprite} [_splash_sprite]=noone Description
 * @param {real} [_splash_seconds]=0 Description
 * @returns {Id.Instance<obj_effect>} Description
 */
function spawn_effect(_sprite, _x, _y, _w, _h, _depth, _dir, _speed, _life_seconds, _splash_sprite = noone, _splash_seconds = 0) {
    return instance_create_layer(_x, _y, "Instances", obj_effect, {
        sprite_index : _sprite,
        target_width : _w,
        target_height : _h,
        depth : _depth,
        move_direction : _dir,
        move_speed : _speed,
        life_seconds : _life_seconds,
        splash_image : _splash_sprite,
        splash_seconds : _splash_seconds
    });
}

function point_check_for_spawn(_p, _ok_tilemap, _collision_tilemap, _width, _height) {
    if (typeof(_collision_tilemap) == "array") {
        var _res = true;
        for (var _i = 0; _i < array_length(_collision_tilemap); _i++) {
            _res = _res && point_check_for_spawn(_p, _ok_tilemap, _collision_tilemap[_i], _width, _height);
        }
        return _res;
    }
    
    if (tilemap_get_at_pixel(_ok_tilemap, _p.x, _p.y) <= 0 || tilemap_get_at_pixel(_collision_tilemap, _p.x, _p.y) > 0) {
        return false;
    }
    
    var _top_left = new Vec2(_p.x-_width/2, _p.y-_height/2);
    if (tilemap_get_at_pixel(_ok_tilemap, _top_left.x, _top_left.y) <= 0 || tilemap_get_at_pixel(_collision_tilemap, _top_left.x, _top_left.y) > 0) {
        return false;
    }
    var _top_right = new Vec2(_p.x+_width/2, _p.y-_height/2);
    if (tilemap_get_at_pixel(_ok_tilemap, _top_right.x, _top_right.y) <= 0 || tilemap_get_at_pixel(_collision_tilemap, _top_right.x, _top_right.y) > 0) {
        return false;
    }
    var _bot_left = new Vec2(_p.x-_width/2, _p.y+_height/2);
    if (tilemap_get_at_pixel(_ok_tilemap, _bot_left.x, _bot_left.y) <= 0 || tilemap_get_at_pixel(_collision_tilemap, _bot_left.x, _bot_left.y) > 0) {
        return false;
    }
    var _bot_right = new Vec2(_p.x+_width/2, _p.y+_height/2);
    if (tilemap_get_at_pixel(_ok_tilemap, _bot_right.x, _bot_right.y) <= 0 || tilemap_get_at_pixel(_collision_tilemap, _bot_right.x, _bot_right.y) > 0) {
        return false;
    }
    
    return true;
}

/**
 * Function Try to spawn a ghost enemy
 * @param {id.TileMapElement} ok_tilemap Tilemap of ground (walkable tilemap)
 * @param {id.TileMapElement} collision_tilemap Tilemap of colliders (walls)
 * @returns {bool} True if the spawn was successful.
 */
function spawn_ghost(ok_tilemap, collision_tilemap) {
    
    var _spawn_points = [
            new Vec2(x+32, y), new Vec2(x-32, y), new Vec2(x, y+32), new Vec2(x, y-32), 
            new Vec2(x+40, y), new Vec2(x-40, y), new Vec2(x, y+40), new Vec2(x, y-40),
            new Vec2(x+28, y), new Vec2(x-28, y), new Vec2(x, y+28), new Vec2(x, y-28),
    
    ];
    //var collision_tilemap = layer_tilemap_get_id("Tiles_Col");
    //var ok_tilemap = layer_tilemap_get_id("Tiles_Back");
    var _spr = object_get_sprite(obj_enemy_ghost);
    var _spr_w = sprite_get_width(_spr);
    var _spr_h = sprite_get_height(_spr);
    
    for (var _i = 0; _i < array_length(_spawn_points); _i++)
    {
        if (point_check_for_spawn(_spawn_points[_i], ok_tilemap, collision_tilemap, _spr_w, _spr_h) ) {
            show_debug_message($"Spawned ghost @ {_i}: {_spawn_points[_i]}");
            instance_create_layer(_spawn_points[_i].x, _spawn_points[_i].y, "Instances", obj_enemy_ghost);
            return true;
        }
    }
    
    return false;
}












