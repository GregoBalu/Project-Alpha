function sc_fish(){

}



function draw_rope(x1, y1, x2, y2)
{
    var _segments = 8;
    var _smoothness = 2;// 2-3 iterations is enough
    
    var dist = point_distance(x1, y1, x2, y2);
    var sag_base = 30;
    var rest_len = 80; // your rope's natural length

    var stretch = max(dist / rest_len, 0.3);

    // less sag when stretched, more when slack
    var sag = sag_base * (1 / stretch);
    var stretch_effect = clamp((stretch - 1) * 50, 0, 40);
    
    var rope_x = array_create(_segments, 0);
    var rope_y = array_create(_segments, 0);

    for (var i = 0; i <= _segments; i++)
    {
        var t = i / _segments;
    
        rope_x[i] = lerp(x1, x2, t);
        rope_y[i] = lerp(y1, y2, t);
    }
    
    for (var i = 1; i < _segments; i++)
    {
        var t = i / _segments;
    
        // base sag
        var sag_curve = sag * (t * (1 - t));
    
        // stretch pulls rope straighter
        var stretch_pull = stretch_effect * (t * (1 - t));
    
        rope_y[i] += sag_curve - stretch_pull;
    }
    
    for (var k = 0; k < _smoothness; k++) 
    {
        for (var i = 1; i < _segments; i++)
        {
            rope_x[i] = (rope_x[i-1] + rope_x[i] + rope_x[i+1]) / 3;
            rope_y[i] = (rope_y[i-1] + rope_y[i] + rope_y[i+1]) / 3;
        }
    }
    
    
    for (var i = 0; i < _segments; i++)
   {
       draw_line_width(rope_x[i], rope_y[i], rope_x[i+1], rope_y[i+1], 1.0);
   }
}







