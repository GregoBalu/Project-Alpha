offset = new Vec2(0,0);
follow_point = new Vec2(0,0);

cam = view_camera[0];
cam_w = camera_get_view_width(cam); 
cam_w2 = cam_w/2; 
cam_h = camera_get_view_height(cam);
cam_h2 = cam_h /2;

cam_shake = instance_create_layer(x, y, "Instances", obj_camera_shake);
