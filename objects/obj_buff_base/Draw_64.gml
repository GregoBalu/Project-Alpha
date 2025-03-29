//display_set_gui_size(640, 320);
//show_debug_message("drawGUI buff base @ {0},{1}", x, y);
draw_self();
if (stack > 1) {
    draw_textbox(bbox_right, bbox_bottom, sprite_width/2, sprite_height/2, $"x{stack}", fa_right, fa_bottom);
}
