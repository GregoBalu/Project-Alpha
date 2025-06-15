
enum PressurePlateState { Pressed, NotPressed };
state = PressurePlateState.NotPressed

image_index = 0;
image_speed = 0;

if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}