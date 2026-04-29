draw_self();

if (DEBUG && image_index < hitboxes_len) {
    
    if (hitboxes[image_index] != undefined) {
        var _hb = hitboxes[image_index];
        draw_rectangle_colour(x+_hb.left, y+_hb.top, x+_hb.right, y+_hb.bottom, c_red, c_red, c_red, c_red, true);
    }
}