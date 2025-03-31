// Inherit the parent event
event_inherited();

sub_img = 1;
frame = 0;
anim_speed = 0.4 * TIME_SECOND;

if (prefilled) {
    state = InterractItemState.Undisturbed;
} else {
    state = InterractItemState.Interracted;
}

function onInterract() {
    audio_play_sound(snd_drink, 5, false, 1.1);
    obj_player.hp = clamp(obj_player.hp + healing_amount, 0, obj_player.hp_total);
    obj_player.add_corruption(corruption_amount);
}