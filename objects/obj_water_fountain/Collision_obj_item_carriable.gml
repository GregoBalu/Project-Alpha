if (!is_on) {
    exit;
}

if (is_plugged) {
    exit;
}

if (other.carried_by == noone) {
    plug(other);
}