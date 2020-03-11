//keep track of how long different directions have been held

var is_run = keyboard_check(vk_shift);

var input_held = [keyboard_check(vk_right) or keyboard_check(ord("D")),
keyboard_check(vk_up) or keyboard_check(ord("W")),
keyboard_check(vk_left) or keyboard_check(ord("A")),
keyboard_check(vk_down) or keyboard_check(ord("S"))];

for (var i = 0; i < 4; ++i)
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
keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))];

//double this if fps doubles, obviously
var input_repeat = [false, false, false, false];

for (var i = 0; i < 4; ++i)
{
	input_repeat[i] = (input_frames[i] - 12) >= 0 and (input_frames[i] - 10) mod 9 == 0;	
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

if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}