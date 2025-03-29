/// @function                   screenshake(_time, _magnitude, _fade);
/// @param  {real}  _delay      The delay of time after the shake begins
/// @param  {real}  _time       The length of time - in steps - to shake the screen
/// @param  {real}  _magnitude  The amount of screenshake to apply
/// @param  {real}  _fade       How quickly the screenshake effect will fade out
/// @description    Set the screenshake object variables.

function screenshake(_delay, _time, _magnitude, _fade)
{
    //show_debug_message("Screenshake");
    //var _iid = instance_create_layer(0, 0, layer_get_id("Instances"), obj_camera_shake);
    with (obj_camera_shake)
    {
        shake = true;
        shake_delay = _delay;
        shake_time = _time;
        shake_magnitude = _magnitude;
        shake_fade = _fade;
    }
}
