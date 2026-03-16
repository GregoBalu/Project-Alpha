show_debug_message($"Room change manager created room={room_id} effect={effect}");
if (room_id == noone) {
    show_debug_message("Empty room_id in room_change_manager");
    instance_destroy();
}

enum RoomChangerManagerAlarms { Fade = 0, Spiral = 1, Spin = 2, ChangeRoom = 5 };

global.do_pause = true;

changed_room = false;
depth = -1;

effectData = undefined;

FadeTick = 2; // Frequency of fade in/out progress
FadeTickAmount = 10; // 0-100 %

SpiralTick = 5;
SpiralTickAmount = 8;

SpinTick = 4;
SpinTickAmount = 6;

doEffect = undefined;
switch (effect) {
    case RoomTransition.Instant:
        doEffect = function() {
            if (!changed_room) {
                //show_debug_message("Room change manager effect instant");
                alarm[RoomChangerManagerAlarms.ChangeRoom] = 1;
            }
        };
        
        break;
    case RoomTransition.Fade:
        effectData = {
            progress : 0
        };
        doEffect = function() {
            //show_debug_message("Room change manager effect start fade");
            alarm[RoomChangerManagerAlarms.Fade] = FadeTick;
        }
        
        break;
    case RoomTransition.Spiral:
        effectData = {
            progress : 0,
            subimg : 0
        };
        doEffect = function() {
            //show_debug_message("Room change manager effect start spiral");
            alarm[RoomChangerManagerAlarms.Spiral] = SpiralTick;
        };
        break;
    case RoomTransition.Spin:
        effectData = {
            progress : 0
        };
        doEffect = function() {
            //show_debug_message("Room change manager effect start spin");
            alarm[RoomChangerManagerAlarms.Spin] = SpinTick;
        };
        break;
    default:
        //show_debug_message($"Unknown effect: {effect}");
        instance_destroy();
}

doEffect();

