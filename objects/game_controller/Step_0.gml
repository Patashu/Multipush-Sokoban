global.last_room = room;

if (keyboard_check_pressed(ord("Q")) or keyboard_check_pressed(vk_escape))
{
	room_goto(global.escape_room);	
}