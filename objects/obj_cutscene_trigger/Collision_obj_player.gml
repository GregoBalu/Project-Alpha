if (cutscene_instance == undefined) exit;
if (fired) exit;

obj_camera.follow_player = false;
obj_player.immobilized = true;
cutscene_instance.transitionTo();
fired = true;
instance_destroy();