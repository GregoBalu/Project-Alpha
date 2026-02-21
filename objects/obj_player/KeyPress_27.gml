if (instance_exists(obj_playersheet) && obj_playersheet.state != State.Closed) exit;
    
if (show_question(getText("Quit_confirm"))) {
    game_restart();
}