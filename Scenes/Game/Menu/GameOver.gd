extends Node2D

func _on_Replay_pressed():
	var _reload = get_tree().reload_current_scene()
