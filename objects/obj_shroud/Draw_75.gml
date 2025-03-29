if (debug_level > 0) {

    var _x = 16;
    var _y = 16;
    draw_rectangle_color(_x, _y, _x+80, _y+24, c_white, c_white, c_white, c_white, false);
    draw_text_transformed(_x+2, _y, "FPS = " + string(fps), 1, 1, 0);
}