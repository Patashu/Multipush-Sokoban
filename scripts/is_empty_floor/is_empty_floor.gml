///is_empty_floor(xx, yy)

var xx = argument0;
var yy = argument1;

return ((collision_point(xx, yy, floor_object, false, false) != noone)
and
(collision_point(xx, yy, block_object, false, false) == noone))