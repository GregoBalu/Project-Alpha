draw_self();

if (DEBUG && image_index < hitboxes_len) {
    
    if (hitboxes[image_index] != undefined) {
        var _hb = hitboxes[image_index];
        
        draw_set_colour(c_red);
        _hb.draw(self);
        draw_set_colour(c_black);
    }
}
