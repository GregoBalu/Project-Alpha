// Inherit the parent event
event_inherited();

for (var _i = 0; _i < array_length(dialog); ++_i)
{
    if (dialog[_i].type == DialogType.Choice) {
        for (var _j = 0; _j < array_length(dialog[_i].choices); ++_j)
        {
            dialog[_i].choices[_j].reset();
        }
    }
}