if (!is_on || paused) exit;

if (hitboxes_len>0) {
    if (hitboxes_len <= image_index) exit;
        
    if (hitboxes[image_index] == undefined) exit;
        
    if (!hitboxes[image_index].isColliding(self, other)) exit;
    
    onPlayerCollide();
} else {
    
    onPlayerCollide();
}