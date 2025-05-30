// Inherit the parent event
event_inherited();

speed_increase = 0.1;

max_stacks = 5;
name = "Sure foot";
hint = $"Speed: +{speed_increase}";

function effect() {

    obj_player.move_speed += speed_increase;
}