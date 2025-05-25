// Inherit the parent event
event_inherited();

crit_increase = 0.3 / 100; //0.3%

max_stacks = 5;
name = "Lucky day";
hint = $"Crit chance: +{crit_increase*100}%";

function effect() {

    obj_player.crit_chance += crit_increase;
}