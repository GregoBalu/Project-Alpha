/// @description Init dice rolls

--dice_rolls;
reroll(true);

if (dice_rolls <= 0) {
    clickable = true;
    exit;
}

alarm[0] = dice_roll_delay;