// Inherit the parent event
event_inherited();

enum NPCBurrowAlarms { UpdateEye = 2 };

enum NPCBurrowTargetIds { NoTarget = -1, Target1 = 1, Target2 = 2 };

show_eye = false;
eye_subimg = 0;
eye_fps = 6;

shiny_gifted = 0;

alarm[NPCBurrowAlarms.UpdateEye] = TIME_SECOND/eye_fps;

particle_system = part_system_create(ps_burrow_dig);
part_emitter = part_emitter_create(particle_system);
part_system_depth(particle_system, depth+1);
particle_emitter_interval_quicken = false;


part_system_position(particle_system, x, y);
part_emitter_enable(particle_system, part_emitter, true);

onFollowTarget = function() {
    if (follow_target != noone) {
        show_eye = true;
        
    } else {
        show_eye = false;
    }
}

dialog_cave_burrow = [
    new dialog_entry(global.dialog_player_name, global.dialog_player_color, spr_player_idle_down, new dialog_text("Uhm, hi? Anyone there?")),
    new dialog_entry("Burrow", c_olive, spr_burrow, new dialog_text("No shiny, no yappin"))

];
dialog_cave_burrow_gifted = [
    new dialog_entry("Burrow", c_olive, spr_burrow, new dialog_text("I be helpin' ya, for a moment.")),
    new dialog_entry("Burrow", c_olive, spr_burrow, new dialog_text("I can dig new tunnels and collapse old ones."))
];
dialog = dialog_cave_burrow;
