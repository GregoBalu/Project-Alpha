if (!is_on) {
    exit;
}

if (!doExtending) {
    exit;
}

if (doDamage) {
    //if (do_damage_entity)
    
    var _progress = (state/State_EXTENDED);
    var _spear_tip_offset = sprite_width*_progress;
    if ( image_angle>45&&image_angle<135 ) {
        if (collision_rectangle(bbox_left, bbox_bottom - _spear_tip_offset, bbox_right, bbox_bottom - _spear_tip_offset + spear_tip_width, other, true, true) == noone) {
            exit;
        }
    } else if ( image_angle>225&&image_angle<315 ) {
        if (collision_rectangle(bbox_left, bbox_top + _spear_tip_offset, bbox_right, bbox_top + _spear_tip_offset - spear_tip_width, other, true, true) == noone) {
            exit;
        }
    } else if (image_angle>=135 && image_angle<=225) {
        if (collision_rectangle(bbox_right - _spear_tip_offset + spear_tip_width, bbox_top, bbox_right - _spear_tip_offset, bbox_bottom, other, true, true) == noone) {
            exit;
        }
    } else {
        if (collision_rectangle(bbox_left + _spear_tip_offset - spear_tip_width, bbox_top, bbox_left + _spear_tip_offset, bbox_bottom, other, true, true) == noone) {
            exit;
        }
    }
    
    
    doDamage = false;
    obj_player.hp -= damage;
    obj_player.statistic.damage_by_speartrap += damage;
    obj_player.statistic.damage_by_speartrap_count++;
    
    spawn_blood_on(obj_player);
    //sprite_add_ext()
    alarm[Alarm_Damage_CD] = 0.2 * TIME_SECOND;
}
