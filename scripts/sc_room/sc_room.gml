
enum RoomTransition { Instant, Fade, Spiral, Spin };


function change_room_to(_id, _effect = RoomTransition.Instant){
    
    instance_create_layer(0, 0, "Instances", obj_room_change_manager, {
        room_id : _id,
        effect : _effect
    });

}