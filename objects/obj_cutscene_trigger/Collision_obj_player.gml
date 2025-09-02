if (cutscene_instance == undefined) exit;
if (fired) exit;

cutscene_instance.transitionTo();
fired = true;
instance_destroy();