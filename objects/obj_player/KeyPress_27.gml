if (instance_exists(obj_playersheet) && obj_playersheet.state != State.Closed) exit;
    
if (show_question("Do you want to really quit?")) {
    game_restart();
}