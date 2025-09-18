visible = false;

clearArea = function() {
    shroud_clear_area(new Vec2(bbox_left, bbox_top), new Vec2(bbox_right, bbox_bottom));
    instance_destroy();
}
exit;
if (!instance_exists(obj_shroud)){
    alarm[0] = 10;
} else {
    clearArea();
}


