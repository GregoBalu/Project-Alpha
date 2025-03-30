function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
};

enum DialogType { Chat, Choice };

/**
 *  Function Description
 * @param {string} _name  Name of the speaker
 * @param {Constant.Color} _color  Color of the speaker's name
 * @param {Asset.GMSprite} _sprite  The sprite of the speaker.
 * @param {string} _msg  The message the speaker says
 * @param {Asset.GMFont} [_msg_font]=font_base  font_base Description
 * @param {Constant.Color} [_msg_color]=c_ltgray  c_ltgray Description
 * @param {function} [_on_start_action]=function(){} Function to call on the first frame of this dialog
 * @param {function} [_on_end_action]=function() {} Function to call on after the last frame of this dialog
 * @returns {struct}  Dialog struct
 */
function dialog_entry(_name, _color, _sprite, _msg, _msg_font = font_base, _msg_color = c_ltgray, 
        _on_start_action = function(){}, _on_end_action = function(){}) constructor {
    
    type = DialogType.Chat;
    name = _name;
    color = _color;
    spr = _sprite;
    msg = _msg;
    msg_font = _msg_font;
    msg_color = _msg_color;
            
    _startAction = _on_start_action;
    _endAction = _on_end_action;
    onStart = function() { _startAction(); }
    onEnd = function() { _endAction(); }
}

dialog_player_name = "Omar";
dialog_player_color = c_lime;

dialog_welcome = [
    new dialog_entry("Geoff", c_aqua, spr_npc1, "Hey, I started to worry you wouldn't show up at all. What took you so long?"),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, "Sorry, I got held up by the guards at the city exit. So where is this Witch you were talking about?"),
    new dialog_entry("Geoff", c_aqua, spr_npc1, "She ... It went deep inside this dungeon of sort but it may know our plan. It started to prepare. Be on your guard!"),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, "Will do. Any sign of corruption yet? ..."),
    new dialog_entry("", c_white, undefined, "<A loud bang shakes the ground>", font_base_italic, c_ltgray, 
        function() {
            screenshake(0, 3*TIME_SECOND, 2, 0.25);
        }, function() {
            screenshake_stop();
        }),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, "Nevermind, I'll get started!")
];
dialog_welcome_alt = [
new dialog_entry("Geoff", c_aqua, spr_npc1, "Get in there and slay that Witch!")
];






