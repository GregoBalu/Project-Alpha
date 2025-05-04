// Inherit the parent event
event_inherited();

sub_img = 1;
frame = 0;
anim_speed = 0.4 * TIME_SECOND;
ingredient = noone;

topLeft = new Vec2(x - sprite_width/2, y - sprite_height/2);

if (prefilled) {
    state = InterractItemState.Undisturbed;
    if (prefilled_ingredient == noone) {
        show_debug_message($"No prefill ingredient set for {id}");
    }
    ingredient = prefilled_ingredient;
} else {
    state = InterractItemState.Interracted;
}

function onInterract() {
    audio_play_sound(snd_drink, 5, false, 1.1);
    ingredient.onBrew();
    ingredient = noone;
    obj_player.add_corruption(corruption_amount);
}