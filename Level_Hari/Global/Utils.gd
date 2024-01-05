extends Node

const SAVE_PATH = "res://Level_Hari/savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"playerHP": Game.playerHP,
		"Gold": Game.gold
	}
	
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.g3et_line())
			if current_line:
				Game.PlayerClass = current_line["PlayerClass"]
				Game.gold = current_line["gold"]
				
	
