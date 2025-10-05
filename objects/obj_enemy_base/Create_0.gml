event_inherited();

target_x = x;
target_y = y;
using_path = false;

see_player = false;
player_close = false;

scale_level = level;

particle_system = undefined;
var len = array_length(battle_buff);
if (len > 0 ) {
    for (var _i = 0;  _i < len; _i++)
    {
        if (battle_buff[_i] == "Frenzy") {
            particle_system = part_system_create(ps_frenzy_effect);
            part_emitter = part_emitter_create(particle_system);
            part_system_depth(particle_system, depth-1);
            
            
            part_system_position(particle_system, x, y);
            part_emitter_enable(particle_system, part_emitter, true);
        }
    }
}

check_player_close = function() {
    if (distance_to_object(obj_player) < camera_get_view_width(obj_player.camera.cam)*1.5) {
        player_close = true;
        visible = true;
    } else {
        player_close = false;
        visible = false;
    }
    alarm[11] = random_range(1.5,2.5)*TIME_SECOND;
}
check_player_close();

animation = {
    idle_stand: sprite_index,
    isFirstStand: true,
    walk_up: sprite_index,
    walk_right: sprite_index,
    walk_down: sprite_index,
    walk_left: sprite_index
};


loot_point_offset = array_create(2);
if (loot_point[0] == 0 && loot_point[1] == 0) {
    loot_point_offset = [0,0];
} else {
    loot_point_offset[0] = loot_point[0]-x;
    loot_point_offset[1] = loot_point[1]-y;
    //show_debug_message($"loot to {loot_point[0]},{loot_point[1]} -> offset={loot_point_offset[0]},{loot_point_offset[1]}");
}

if (wander_range > 0 && move_speed > 0) {
    alarm[0] = move_tickdelay_seconds * TIME_SECOND;
}

battle = {
    animation_attack: noone,
    animation_attack_fps: 1,
    animation_heavyattack: noone,
    animation_heavyattack_fps: 1,
    animation_interrupt: noone,
    animation_interrupt_fps: 1,
    animation_wait: noone,
    animation_wait_fps: 1,
    animation_cast: noone,
    animation_cast_fps: 1,
    idle_sound: noone,
    idle_sound_min_seconds: 5,
    idle_sound_max_seconds: 10,
    
    cast_source_delta: new Vec2(-20, -sprite_height/2),
    
    battle_screen_sprite: spr_battle_screen,
    battle_screen_sprite_speed: 1,
    battle_screen_animated: spr_battle_screen_splitted,
    battle_screen_animated_max_frames: 14,
    battle_screen_animated_fps: 10
};
if (room == Room1) {
    battle.battle_screen_sprite = spr_battle_screen_dungeon;
    battle.battle_screen_sprite_speed = 4;
    battle.battle_screen_animated = spr_battle_screen_dungeon_animated;
    battle.battle_screen_animated_max_frames = 8;
    battle.battle_screen_animated_fps = 6;
} else if (room == rm_cave) {
    battle.battle_screen_sprite = spr_battle_screen_cave;
    battle.battle_screen_sprite_speed = 4;
    battle.battle_screen_animated = spr_battle_screen_splitted;
}

initBattleBuffs = function(_self) {
    //Override me
    var len = array_length(_self.data.battle_buff);
    if (len > 0 ) {
        for (var _i = 0;  _i < len; _i++)
        {
            if (_self.data.battle_buff[_i] == "Frenzy") {
                _self.add_buff(buff_create_frenzy(10*global.BUFF_TURNS_PER_COMBAT_TURNS))
                
                if (_self.particles == undefined) {
                    _self.particles = ds_list_create();
                }
                var _dat = {
                    ps : part_system_create(ps_frenzy_effect),
                    pe: undefined
                };
                _dat.pe = part_emitter_create(_dat.ps);
                
                //TODO: ? resize emitter?
                
                part_system_depth(_dat.ps, _self.depth-1);
                part_system_position(_dat.ps, _self.x, _self.y);
                part_emitter_enable(_dat.ps, _dat.pe, true);
                ds_list_add(_self.particles, _dat);
            }
        }
    }
}
initBattle = function(_self) {
    //Override me
}

doEnemyAction = function(_selfData, _playerData) {
    //Override me
    return enemyWait(obj_battle_enemy);
}

battleDraw = function(_self) {
    //Override me
}
onBattleEnd = function(_self) {
    if (_self.particles != undefined) {
        for (var _i = 0; _i < ds_list_size(_self.particles); ++_i)
        {
            part_emitter_destroy(_self.particles[|_i].ps, _self.particles[|_i].pe);
            part_system_destroy(_self.particles[|_i].ps);
        }
        ds_list_destroy(_self.particles);
    }
}