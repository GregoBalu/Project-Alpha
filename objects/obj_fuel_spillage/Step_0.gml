if (life_over) {
    image_alpha -= 0.05;
    image_xscale = image_xscale*0.98;
    image_yscale = image_yscale*0.98;
    if (image_alpha <= 0) {
        instance_destroy();
        return;
    }
}