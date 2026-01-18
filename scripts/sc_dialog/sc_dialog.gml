function initDialog() {
    initInput();
    
    global.dialog_player_name = "Vhalyan";
    global.dialog_player_color = c_lime;
    
    global.dialog_vendor_name = "Sha'd Yvend'r";
    global.dialog_vendor_color = c_orange;
}
initInput();

function NOOP() {}

function create_dialog(_messages, _fullscreen = false){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog, {
        fullscreen: _fullscreen        
    });
    _inst.messages = _messages;
    _inst.current_message = 0;
};

enum DialogType { Chat, Choice };

/**
 * Create a new Dialog text element
 * @param {string} _msg Text
 * @param {Asset.GMFont} [_msg_font]=font_base Font of text
 * @param {Constant.Color} [_msg_color]=c_ltgray Color of text
 */
function dialog_text(_msg, _msg_font = font_base, _msg_color = c_ltgray) constructor {
    
    text = _msg;
    font = _msg_font;
    color = _msg_color;
}

/**
 *  Create a new simple Dialog entry
 * @param {string} _name  Name of the speaker
 * @param {Constant.Color} _color  Color of the speaker's name
 * @param {Asset.GMSprite} _sprite  The sprite of the speaker.
 * @param {struct.dialog_text} _msg  The message the speaker says
 * @param {function} [_on_start_action]=function(){} Function to call on the first frame of this dialog
 * @param {function} [_on_end_action]=function(){} Function to call on after the last frame of this dialog
 * @returns {struct}  Dialog struct
 */
function dialog_entry(_name, _color, _sprite, _msg, 
        _on_start_action = function(){}, _on_end_action = function(){}) constructor {
    
    type = DialogType.Chat;
    name = _name;
    color = _color;
    spr = _sprite;
    msg = _msg;
            
    _startAction = _on_start_action;
    _endAction = _on_end_action;
    onStart = function() { _startAction(); }
    onEnd = function() { _endAction(); }
}

/**
 * Create a new Choice Dialog text element
 * @param {string} _text Text
 * @param {function} _on_click_action Function to call on this choice being clicked
 * @param {function} [_cond_action] Function to check appearance condition of this choice
 * @param {Asset.GMFont} [_font]=font_base Font of text
 * @param {Constant.Color} [_color]=c_ltgray Color of text
 */
function dialog_choice_text(_text, _on_click_action, _cond_action = function() { return true; }, _font = font_base, _color = c_ltgray) : dialog_text(_text, _font, _color) constructor {
    
    _condAction = _cond_action;
    function condition() {
        return _condAction();
    }
    
    _clickAction = _on_click_action;
    onClick = function() {
        _clickAction();
    }
    
    reset = function() {
        
    }
}

/**
 *  Create a new Choice dialog entry
 * @param {string} _name  Name of the speaker
 * @param {Constant.Color} _color  Color of the speaker's name
 * @param {Asset.GMSprite} _sprite  The sprite of the speaker.
 * @param {struct.dialog_text} _msg  The message the speaker says
 * @param {Array.dialog_choice_text} _choices The choices the player can take.
 * @param {function} _on_start_action  function(){} Function to call on the first frame of this dialog
 * @param {function} [_on_end_action]=function(){} Function to call on after the last frame of this dialog
 * @returns {struct}  Dialog struct
 */
function dialog_choice_entry(_name, _color, _sprite, _msg, _choices, 
        _on_start_action = function(){}, _on_end_action = function(){}) : 
            dialog_entry(_name, _color, _sprite, _msg, _on_start_action, _on_end_action) constructor {
            
    type = DialogType.Choice;
    choices = _choices;
}

global.dialog_player_name = "Omar";
global.dialog_player_color = c_lime;

global.dialog_vendor_name = "Sha'd Yvend'r";
global.dialog_vendor_color = c_orange;


