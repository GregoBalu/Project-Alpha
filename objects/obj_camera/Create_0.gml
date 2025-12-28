offset = new Vec2(0,0);
follow_point = new Vec2(0,0);
follow_player = true;

cam = view_camera[0];
cam_w = camera_get_view_width(cam); 
orig_cam_w = cam_w;
cam_w2 = cam_w/2; 
cam_h = camera_get_view_height(cam);
orig_cam_h = cam_h;
cam_h2 = cam_h /2;

cam_shake = instance_create_layer(x, y, "Instances", obj_camera_shake);

previous_zoom_factor = 1;
zoom_factor = 1;
