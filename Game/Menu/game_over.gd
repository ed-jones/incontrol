class_name GameOver
extends Node2D

func _on_Replay_pressed() -> void:
	var _did_reload = get_tree().reload_current_scene()
