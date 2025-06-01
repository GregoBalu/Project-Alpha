y -= vertical_speed;
x = xstart + clamp(2*sin((ystart-y)/4), -max_sway, max_sway);