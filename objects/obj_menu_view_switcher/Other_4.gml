var temp = view_camera[0];
view_camera[0] = view_camera[from_view];
view_camera[from_view] = temp;

instance_destroy();