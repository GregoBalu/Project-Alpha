current_force += FORCE_STEP;
boost_percent += .1;

//show_debug_message($"boost: {boost_percent*100}% : {current_force}")

if (boost_percent >= 1) {
    //show_debug_message("Boost!");
    exit;
}

alarm[0] = BOOST_TICK;