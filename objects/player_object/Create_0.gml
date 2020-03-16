strength = 4;
depth = layer_get_depth(layer_get_id("Actors"));
dir = -1;

input_frames = [0, 0, 0, 0, 0];

frames_since_dir_change = 0;
idle_animation_state = 1;
next_animation_delay = irandom_range(300, 600);