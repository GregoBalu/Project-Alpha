draw_self();

if (DEBUG) {
    var _progress = (state/State_EXTENDED);
    var _spear_tip_offset = sprite_width*_progress;
    if ( (image_angle>45&&image_angle<135) ) {
        draw_rectangle_color(bbox_left, bbox_bottom - _spear_tip_offset, bbox_right, bbox_bottom - _spear_tip_offset + spear_tip_width, c_red, c_red, c_red, c_red, false);
    } else if ( (image_angle>225&&image_angle<315) ) {
        draw_rectangle_color(bbox_left, bbox_top + _spear_tip_offset, bbox_right, bbox_top + _spear_tip_offset - spear_tip_width, c_red, c_red, c_red, c_red, false);
    }
    else if ( (image_angle<=45 && image_angle>=0) || (image_angle<=360 && image_angle>=315)) {
        draw_rectangle_color(bbox_left + _spear_tip_offset - spear_tip_width, bbox_top, bbox_left + _spear_tip_offset, bbox_bottom, c_red, c_red, c_red, c_red, false);
    }
    else if ( image_angle>=135 && image_angle<=225 ) {
        draw_rectangle_color(bbox_right - _spear_tip_offset + spear_tip_width, bbox_top, bbox_right - _spear_tip_offset, bbox_bottom, c_red, c_red, c_red, c_red, false);
    }
}