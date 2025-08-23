///@description Size increase at the start of the lifetime

image_xscale = image_xscale*1.1;
image_yscale = image_yscale*1.1;

if (image_xscale >= scaling) {
    image_xscale = scaling;
    image_yscale = scaling;
} else {
    alarm[FuelSpillageAlarms.SizeIncresae] = 10;
}
