if (can_interract && interract_as_collision && state == InterractItemState.Undisturbed) {
    onInterract();
    state = InterractItemState.Interracted;
}