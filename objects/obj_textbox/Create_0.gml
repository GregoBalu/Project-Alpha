init_localisation();
text = getText(text);

width = bbox_right - bbox_left;
width_half = width*0.5;
height = bbox_bottom - bbox_top;
height_half = height*0.5;

posX = x;
posY = y;

if (h_align == fa_center) {
    posX += width_half;
} else if (h_align == fa_right) {
    posX = bbox_right;
}

if (v_align == fa_middle) {
    posY += height_half;
} else if (v_align == fa_bottom) {
    posY = bbox_bottom;
}
