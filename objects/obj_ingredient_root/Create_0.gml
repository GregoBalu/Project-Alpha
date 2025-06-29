// Inherit the parent event
event_inherited();

healing_amount = 6;

image_xscale = 0.8;
image_yscale = 0.8;

onBrew = function() {
    var _hp_begin = obj_player.hp;
    obj_player.hp = clamp(obj_player.hp + healing_amount, 0, obj_player.hp_total);
    var _actual_healing = obj_player.hp - _hp_begin;
    obj_player.statistic.healing_cauldron += _actual_healing;
    obj_player.statistic.healing_cauldron_count++;
}
    
