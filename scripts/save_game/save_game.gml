///save_game(filename)

var filename = argument0;

//do this first
initialize_game_data();

//write the file to filename

var save_file_text = json_encode(global.game_data);

if (file_exists(filename)) { file_copy(filename, filename + ".bkp"); file_delete(filename); }

var file = file_text_open_write(filename);
file_text_write_string(file, save_file_text);
file_text_close(file);