init_localisation();

options = ["None"];
selected_index = 0;

text_width = (bbox_right-32)-bbox_left-6;
text_height = (bbox_bottom-bbox_top)-6;

state = 0; //0=closed, 1=opened

onChanged = function() {
    // override me
}
