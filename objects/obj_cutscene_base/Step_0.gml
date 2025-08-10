if (!cutscene.is_finished()) {
    cutscene.stepc();
} else {
    obj_shroud.FOG_ON = true;
    instance_destroy();
}