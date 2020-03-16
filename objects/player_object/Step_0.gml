//keep track of how long different directions have been held

var is_run = keyboard_check(vk_shift);

var input_held = [keyboard_check(vk_right) or keyboard_check(ord("D")),
keyboard_check(vk_up) or keyboard_check(ord("W")),
keyboard_check(vk_left) or keyboard_check(ord("A")),
keyboard_check(vk_down) or keyboard_check(ord("S")),
keyboard_check(vk_backspace) or keyboard_check(ord("Z"))];

for (var i = 0; i < 5; ++i)
{
	if (input_held[i])
	{
		input_frames[i] = input_frames[i] + 1;
	}
	else
	{
		input_frames[i] = 0;
	}
}

var input_pressed = [keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")),
keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")),
keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")),
keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")),
keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(ord("Z"))];

var input_repeat = [false, false, false, false, false];

for (var i = 0; i < 5; ++i)
{
	var c1 = floor(12*room_speed/60);
	var c2 = floor(9*room_speed/60);
	input_repeat[i] = (input_frames[i] - c1) >= 0 and (input_frames[i] - c1) mod c2 == 0;	
}

for (var i = 0; i < 4; ++i)
{
	if (input_pressed[i])
	{
		//for now make run taps safe too
		try_move(id, i, strength, is_run, is_run);
	}
	else if (input_repeat[i])
	{
		try_move(id, i, strength, true, is_run);
	}
}

if (input_pressed[4] or input_repeat[4])
{
	do_undo();
}

if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}

//do idle animation

frames_since_dir_change++;
if (frames_since_dir_change > next_animation_delay)
{
	if (idle_animation_state == 0 or idle_animation_state == 6)
	{
		image_index = 0;
		idle_animation_state = 1;
		next_animation_delay = irandom_range(300, 600);
	}
	else if (idle_animation_state <= 2)
	{
		image_index += 1;
		++idle_animation_state;
		next_animation_delay = 18;
	}
	else if (idle_animation_state == 3)
	{
		image_index += 1;
		++idle_animation_state;
		next_animation_delay = irandom_range(30, 60);
	}
	else if (idle_animation_state <= 5)
	{
		image_index -= 1;
		++idle_animation_state;
		next_animation_delay = 18;
	}
	frames_since_dir_change = 0;
}