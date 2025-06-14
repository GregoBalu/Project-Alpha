function menu_pause_resume(){
    obj_pause_manager.paused = false;
    obj_pause_manager.update_pause();
}

function menu_show_highscores() {
    var temp = view_camera[0];
    view_camera[0] = view_camera[2];
    view_camera[2] = temp;
}