if (level < other.level) exit;
else if (level == other.level && y < other.y) exit;

level += other.level;
switch (level) {
	case 1:
        sprite_index = spr_cockroach;
        break;
    case 2:
        sprite_index = spr_cockroach_v2;
        break;
    case 3:
        sprite_index = spr_cockroach_v3;
        break;
}
instance_destroy(other);