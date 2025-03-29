if (!is_on) {
    exit;
}

if (isPressed) {
    exit;
}

if (other.carried_by == noone) {
    isPressed = true;
}