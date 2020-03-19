global.direction2 = [[1,0],[0,-1],[-1,0],[0,1]];
global.direction_name = ["East","North","West","South"];
#macro TILE_SIZE 32
global.info_message = "";
global.undo_buffer = ds_list_create();
global.turn_count = 0;
global.major_change = false;
#macro UNLIMITED_UNDO false
#macro X_MIDDLE ((bbox_left+bbox_right)/2)
#macro Y_MIDDLE ((bbox_top+bbox_bottom)/2)
global.filename = "save0.sav";
load_game(global.filename);

global.room_names = ds_map_create();
global.room_names[? Level_select_w1] = "World 1\r\n\Castle";
global.room_names[? room1] = "Level 1";
global.room_names[? room2] = "Level 2";
global.room_names[? room3] = "Level 3";
global.room_names[? room4] = "Level 4";
global.room_names[? room5] = "Level 5";
global.room_names[? room6] = "Level 6";
global.room_names[? room7] = "Level 7";
global.room_names[? room8] = "Level 8";
global.room_names[? room9] = "Level 9";
global.room_names[? room10] = "Level 10";
global.room_names[? room11] = "Level 11";
global.room_names[? Troom1] = "Intro 1";
global.room_names[? Troom2] = "Intro 2";
global.room_names[? Troom3] = "Intro 3";
global.room_names[? Troom4] = "Intro 4";
global.room_names[? Troom5] = "Intro 5";
global.room_names[? Troom6] = "Intro 6";
global.escape_room = room;
global.last_nonpuzzle_room = room;