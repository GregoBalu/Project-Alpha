// Inherit the parent event
event_inherited();

healing_amount = 6;

function onBrew() {
    obj_player.hp = clamp(obj_player.hp + healing_amount, 0, obj_player.hp_total);
    
}
    
