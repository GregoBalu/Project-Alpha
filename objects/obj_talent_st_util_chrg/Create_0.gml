// Inherit the parent event
event_inherited();

max_utility_charge_increase = 0.3;

max_stacks = 5;
name = "Third Eye";
hint = $"Max Utility charge: +{max_utility_charge_increase}";

function effect() {

    obj_player.charge_util_total += max_utility_charge_increase;
}