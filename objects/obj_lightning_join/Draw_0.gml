if (distance_to_object(obj_player) > obj_player.camera.cam_w) exit;

draw_self();

if (zapping && zap_length>0) {
    draw_set_alpha(0.05);
    draw_circle_color(x, y, zap_length, c_blue, c_blue, false);
    draw_set_alpha(0.5);
    draw_circle_color(x, y, zap_length, c_blue, c_blue, true);
    draw_set_alpha(1);
}

for (var _i = 0; _i < ds_list_size(paths); _i++)
{
    draw_spline(paths[|_i], spr_lightning, image_index, 8);
}