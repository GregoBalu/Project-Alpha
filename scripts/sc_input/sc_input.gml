function initInput() {
    global.input_up                = ord("W");
    global.input_left              = ord("A");
    global.input_down              = ord("S");
    global.input_right             = ord("D");
    
    global.input_sprint            = vk_shift;
    global.input_playersheet       = vk_tab;
    
    global.input_use               = ord("F");
    global.input_talk              = vk_space;
    
    global.input_pause             = vk_escape;
}

global.input_up                = ord("W");
global.input_left              = ord("A");
global.input_down              = ord("S");
global.input_right             = ord("D");

global.input_sprint            = vk_shift;
global.input_playersheet       = vk_tab;

global.input_use               = ord("F");
global.input_talk              = vk_space;

global.input_pause             = vk_escape;

global.input_battle_light      = ord("A");
global.input_battle_heavy      = ord("S");
global.input_battle_wait       = ord("W");
global.input_battle_interrup   = ord("D");
global.input_battle_ultimate   = ord("F");





/// @desc  Returns a string for the keyboard key that you feed into it
/// @param {Constant.VirtualKey or Real} KeyValue Description
/// @returns {string} Description
function key2str(argument0){
    
    switch argument0
    {
        case	65:		return "A"       
        case	66:		return "B"       
        case	67:		return "C"       
        case	68:		return "D"       
        case	69:		return "E"       
        case	70:		return "F"       
        case	71:		return "G"       
        case	72:		return "H"       
        case	73:		return "I"       
        case	74:		return "J"       
        case	75:		return "K"       
        case	76:		return "L"       
        case	77:		return "M"       
        case	78:		return "N"       
        case	79:		return "O"       
        case	80:		return "P"       
        case	81:		return "Q"       
        case	82:		return "R"       
        case	83:		return "S"       
        case	84:		return "T"       
        case	85:		return "U"       
        case	86:		return "V"       
        case	87:		return "W"       
        case	88:		return "X"       
        case	89:		return "Y"       
        case	90:		return "Z"       
        case vk_lcontrol:
        case	162:	return "L CTRL"		 
        case vk_rcontrol:
        case	163:	return "R CTRL"		 
        case vk_lalt:
        case	164:	return "L ALT"       
        case vk_ralt:
        case	165:	return "R ALT"       
        case	186:	return ";"
        case	222:	return "'"
        case vk_enter:
        case	13:		return "Enter"
        case	220:	return	"\\"
        case vk_backspace:
        case	8:		return	"Backspace"
        case	219:	return "["
        case	221:	return "]"
        case	188:	return ","
        case	190:	return "."
        case	191:	return "/"
        case vk_shift:
        case	16:		return "Shift"
        case vk_tab:
        case	9:		return "Tab"
        case	192:	return "`"
        case	48:		return "0"
        case	49:		return "1"
        case	50:		return "2"
        case	51:		return "3"
        case	52:		return "4"
        case	53:		return "5"
        case	54:		return "6"
        case	55:		return "7"
        case	56:		return "8"
        case	57:		return "9"
        
        case vk_numpad0:
        case	96:		return "Num 0"
        case vk_numpad1:
        case	97:		return "Num 1"
        case vk_numpad2:
        case	98:		return "Num 2"
        case vk_numpad3:
        case	99:		return "Num 3"
        case vk_numpad4:
        case	100:	return "Num 4"
        case vk_numpad5:
        case	101:	return "Num 5"
        case vk_numpad6:
        case	102:	return "Num 6"
        case vk_numpad7:
        case	103:	return "Num 7"
        case vk_numpad8:
        case	104:	return "Num 8"
        case vk_numpad9:
        case	105:	return "Num 9"
        case vk_divide:
        case	111:	return "Num /"
        case vk_multiply:
        case	106:	return "Num *"
        case vk_add:
        case	107:	return "Num +"
        case vk_decimal:
        case	110:	return "Num ."
        case vk_subtract:
        case	109:	return "Num -"
        
        case vk_f1:
        case	112:	return "F1"
        case vk_f2:
        case	113:	return "F2"
        case vk_f3:
        case	114:	return "F3"
        case	115:	return "F4"
        case	116:	return "F5"
        case	117:	return "F6"
        case	118:	return "F7"
        case	119:	return "F8"
        case	120:	return "F9"
        case	121:	return "F10"
        case	122:	return "F11"
        case	123:	return "F12"
        case	145:	return "ScrLk"
        case	19:		return "Pause"
        case	20:		return "Caps Lock"
        case	189:	return "-"
        case	187:	return "="
        case	45:		return "Insert"
        case	36:		return "Home"
        case	33:		return "Page Up"
        case	34:		return "Page Down"
        case	35:		return "End"
        case	46:		return "Delete"
        case	144:	return "NumLock"
        case	38:		return "Up"
        case	40:		return "Down"
        case	37:		return "Left"
        case	39:		return "Right"
        case	91:		return "L Windows"
        case	92:		return "R Windows"
        case	32:		return "Space"
        case	0:		return " "
        case	179:	return "Play"
        case	173:	return "Mute"
        case	174:	return "Volume Down"
        case	175:	return "Volume Up"
        case vk_escape: return "Esc";

        default:		return "key doesn't exist in this map"
    }
}

