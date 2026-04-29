if (!is_on || paused) exit;

if (hitboxes_len <= image_index) exit;
    
if (hitboxes[image_index] == undefined) exit;
    
if (!hitboxes[image_index].isColliding(other)) exit;

for (var _i = 0; _i < ds_list_size(debuffedTargets); _i++)
{
    if ( instance_exists(debuffedTargets[|_i].effect) && 
            debuffedTargets[|_i].effect.targetObject == obj_player) {
        return;
    }
}

var _buff_data = getBuffData(obj_player);
applyEffect(_buff_data.obj, _buff_data.data);