// Inherit the parent event
event_inherited();

max_charge_increase = 0.2;

max_stacks = 5;
name = "Tense muscles";
hint = $"Max attack charge: +{max_charge_increase}";

function effect() {

    obj_player.charge_attack_total += max_charge_increase;
}