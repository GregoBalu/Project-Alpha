
damaged_recently = false;
can_start = true;
at_end = false;

no_see_tilemaps = [layer_tilemap_get_id("No_light"), layer_tilemap_get_id("Tiles_Col")];

function restart() {
    can_start = false;
    at_end = false;
    x = xstart;
    y = ystart;
    
    y -= 32;
    image_xscale = 1.5;
    image_yscale = 1.5
    
}