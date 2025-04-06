is_in_use = false;
boost_percent = 0;

current_force = force;

arrow_subimg = 0;
default_arrow_fps = 6;
arrow_fps = 6;

BOOST_TICK = max( (force_boost_delay_sec * TIME_SECOND) / 10, 10);
FORCE_STEP = ( (force_boost - force) / 10);

function boost_changed() {
    BOOST_TICK = max( (force_boost_delay_sec * TIME_SECOND) / 10, 10);
    FORCE_STEP = ( (force_boost - force) / 10);
}
