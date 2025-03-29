if (needBuffBarRemove) {
    //remove from buff bar
    if (targetObject.id == obj_player.id) {
        //add to buf bar
        targetObject.buff_bar.removeBuff(self);
    }
}