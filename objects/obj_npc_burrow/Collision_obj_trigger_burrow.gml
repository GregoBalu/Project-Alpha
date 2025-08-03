if (shiny_gifted <= 0) exit;

if (other.target_id == NPCBurrowTargetIds.Target1) {
    instance_destroy(other);
    
    var _inst = instance_create_layer(trap_fountain_target1.x + trap_fountain_target1.sprite_width*0.45, trap_fountain_target1.y + trap_fountain_target1.sprite_height*0.45, "Instances", obj_mound);
    trap_fountain_target1.plug(_inst);

    shiny_gifted--;
    
} else if (other.target_id == NPCBurrowTargetIds.Target2) {
    instance_destroy(other);
    
    var _inst = instance_create_layer(trap_fountain_target2.x + trap_fountain_target2.sprite_width*0.45, trap_fountain_target2.y + trap_fountain_target2.sprite_height*0.45, "Instances", obj_mound);
    trap_fountain_target2.plug(_inst);

    shiny_gifted--;
    
}

if (shiny_gifted <= 0) {
    dialog = dialog_cave_burrow;
    set_follow_target(noone);
}