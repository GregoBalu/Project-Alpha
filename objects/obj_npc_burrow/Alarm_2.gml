
eye_subimg++;
if (eye_subimg > 7) {
    eye_subimg = 0;
}

alarm[NPCBurrowAlarms.UpdateEye] = TIME_SECOND/eye_fps;