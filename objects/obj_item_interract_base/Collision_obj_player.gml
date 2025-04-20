if (can_interract && state == InterractItemState.Undisturbed) {
    onInterract();
    state = InterractItemState.Interracted;
}