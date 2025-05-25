// Inherit the parent event
event_inherited();

health_increase = 1;

max_stacks = 5;
name = "Empowered life";
hint = $"Total health: +{health_increase}";

function effect() {

    obj_player.hp_total += health_increase;
    obj_player.hp += health_increase;
}