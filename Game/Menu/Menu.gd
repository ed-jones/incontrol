extends Node2D
const GAME = preload("res://Game/Game.tscn")

func _on_Button_pressed():
	get_parent().add_child(GAME.instance())
	queue_free()
