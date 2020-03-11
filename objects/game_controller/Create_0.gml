global.direction2 = [[1,0],[0,-1],[-1,0],[0,1]];
global.direction_name = ["East","North","West","South"];
#macro TILE_SIZE 32;
global.info_message = "";
global.undo_buffer = ds_list_create();
global.turn_count = 0;