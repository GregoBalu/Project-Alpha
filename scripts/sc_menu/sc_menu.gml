

function menu_show_highscores() {
    var temp = view_camera[0];
    view_camera[0] = view_camera[2];
    view_camera[2] = temp;
}

function onNewGame() {
    
    global.divine_items = undefined;
    
    
}