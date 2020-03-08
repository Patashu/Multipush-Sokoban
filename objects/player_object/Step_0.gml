if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")))
{
	try_move(id, 0, strength);
}
if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")))
{
	try_move(id, 1, strength);
}
if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")))
{
	try_move(id, 2, strength);
}
if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")))
{
	try_move(id, 3, strength);
}
if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}