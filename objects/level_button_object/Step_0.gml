mouse_focus = (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom));

image_index = mouse_focus ? 1 : 0;

var beaten = global.game_data[? "beaten"];
if (beaten[? room_get_name(destination)])
{
	image_index += 2;	
}

if (mouse_focus and mouse_check_button_pressed(mb_left))
{
	room_goto(destination);
}