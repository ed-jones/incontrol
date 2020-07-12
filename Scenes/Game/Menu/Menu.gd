extends Node2D
const GAME = preload("res://Scenes/Game/Game.tscn")

func _on_Play_pressed():
	get_parent().add_child(GAME.instance())
	queue_free()
