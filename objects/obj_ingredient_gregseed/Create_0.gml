// Inherit the parent event
event_inherited();

function onBrew() {
    var _rand = floor(random_range(0, 6.999));//7seed on bush
    show_debug_message($"gregseed rand={_rand}");
    switch (_rand) {
        case 0:
        case 1:
            obj_player.add_corruption(2);
            show_debug_message("Added 2 corruption");
            break;
        case 2:
        case 3:
            obj_player.add_corruption(4);
            show_debug_message("Added 4 corruption");
            break;
        case 4:
            obj_player.add_corruption(6);
            show_debug_message("Added 6 corruption");
            break;
        case 5:
            obj_player.damage -= 0.5;
            show_debug_message("Removed 0.5 damage");
            //TODO: sound effect
            break;
        case 6:
            obj_player.damage += 0.5;
            show_debug_message("Added 0.5 damage");
            //TODO: sound effect
            break;
        default:
            show_debug_message($"Default switch case {_rand}")
            break;
    }
}