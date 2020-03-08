//update_buttons()

var any_not_held = false;

with (button_object)
{
	held = collision_point(x, y, block_object, false, false) != noone;
	sprite_index = held ? sokobuttonoutline : sokobutton;
	if (!held)
	{
		any_not_held = true;	
	}
}

if (!any_not_held)
{
	global.info_message = "Level complete! Press Q/Esc to leave this puzzle."
}