time += frequency_seconds ;
var _dv = sin(time);

//[ ds - ms ... ds ... ds + ms]
//

var _cs = default_scale + (default_scale * _dv * max_pulse_scale);

image_xscale = _cs;
image_yscale = _cs;
 

if (time > 100) {
    time = 0;
}


