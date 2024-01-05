extends Node2D

func _process(delta):
	if Game.frog == 10:
		Game.frog = 0
		get_tree().change_scene_to_file("res://Level_Hari/win.tscn")
