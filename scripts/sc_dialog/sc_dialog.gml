function initDialog() {
    initInput();
}
initInput();

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

global.dialog_player_name = "Omar";
global.dialog_player_color = c_lime;

global.dialog_welcome = [
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
global.dialog_welcome_alt = [
    new dialog_entry("Geoff", c_aqua, spr_npc1, "Get in there and slay that Witch!")
];

global.dialog_hint_cauldron = [
    new dialog_entry("Cauldron", c_white, spr_cauldron, "This is a cauldron. It's used by witches to brew potions and soup."),
    new dialog_entry("Cauldron", c_white, spr_cauldron, "Most potions brewed in them are beneficial to you but they also make you slightly more prone to corruption."),
    new dialog_entry("Cauldron", c_white, spr_cauldron, "The exact effects are determined by the ingredient used to brew, for example a potion of the roots of Chaka bush heals you.")
]

global.dialog_hint_healing_potion = [
    new dialog_entry("Healing Potion", c_white, spr_heal_bottle, "This is a healing potion loot. If you pick it up you instantly drink it healing your current HP.")
]

global.dialog_hint_playersheet = [
    new dialog_entry("Player sheet", c_white, undefined, $"Open your player sheet with your {key2str(global.input_playersheet)} key to get more information or acquire new talents and equip gear")
]

global.dialog_hint_room1_leverpuzzle = [
    new dialog_entry("Note", c_white, spr_note, "You find a hastely scribbled note describing a room on fire with strange vibrant colors."),
    new dialog_entry("Note", c_green, spr_note, "You cannot make out most of the text just a small drawing on the bottom, which depicts four colors in a row: yellow, green, green, yellow")
];




