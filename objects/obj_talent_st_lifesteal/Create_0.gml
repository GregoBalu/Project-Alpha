// Inherit the parent event
event_inherited();

lifesteal_increase = 0.05;

max_stacks = 5;
name = "Leeching essence";
hint = $"Lifesteal: +{lifesteal_increase*100}%";

function effect() {

    obj_player.lifesteal += lifesteal_increase;
}