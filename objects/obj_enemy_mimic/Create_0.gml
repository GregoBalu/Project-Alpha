// Inherit the parent event
event_inherited();

isSleeping = true;
image_speed = 0;
max_spr_num = sprite_get_number(sprite_index);
animation_delay_seconds = 0.3;


/*battle = {
    animation_attack: noone,
    animation_attack_fps: 1,
    animation_heavyattack: noone,
    animation_heavyattack_fps: 1,
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
    battle_screen_animated: spr_battle_screen_splitted
};*/

initBattle = function(_self) {
    //Override me
    if (_self.image_xscale > 0) {
        _self.image_xscale *= -1;
    }
}

doEnemyAction = function(_selfData, _playerData) {
    //Override me
    return enemySimpleAttack(obj_battle_enemy);
}

battleDraw = function(_self) {
    //Override me
}