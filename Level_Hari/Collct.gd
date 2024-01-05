extends Node2D


var Cherry = preload("res://Level_Hari/Collectible/cherry.tscn")

func _on_timer_timeout():
	var cherryTemp = Cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranx = rng.randi_range(10, 1130)
	var rany = rng.randi_range(440, 480)
	cherryTemp.position = Vector2(ranx, rany)
	add_child(cherryTemp)
