var left   = max(bbox_left, other.bbox_left);
var right  = min(bbox_right, other.bbox_right);
var top    = max(bbox_top, other.bbox_top);
var bottom = min(bbox_bottom, other.bbox_bottom);

if (right > left && bottom > top)
{
    var overlap_area = (right - left) * (bottom - top);
    var my_area = (bbox_right - bbox_left) * (bbox_bottom - bbox_top);

    if (overlap_area >= my_area * 0.5)
    {
        // 50% or more overlap
        immobilized = true;
        sprite_index = spr_cockroach_dead;
        //TODO: audio 
        alarm[2] = 10*TIME_SECOND;
    }
}