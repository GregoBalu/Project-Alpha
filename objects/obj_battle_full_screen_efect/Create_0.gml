effect_sprite = undefined;

effect_opacity = 0;
visible = false;

x = 0;
y = 0;

function display_screen_effect(_sprite, _fps, _opacity, _seconds) {
    image_index = 0;
    sprite_index = _sprite;
    //image_speed = _fps;
    image_alpha = _opacity;
    //effect_sprite = _sprite;
    //effect_opacity = _opacity;
    
    visible = true;

    alarm[1] = _seconds * TIME_SECOND;
}
