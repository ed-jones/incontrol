extends Node2D

func _on_Replay_pressed():
	get_tree().reload_current_scene()
