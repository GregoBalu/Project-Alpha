if (!global.do_draw_adventure_gui) {
    return;
}

display_set_gui_size(640, 320);

//show_debug_message("drawGUI buff bar @ {0},{1}", x, y);
draw_sprite_stretched(spr_box, 0, x, y, width, height);

