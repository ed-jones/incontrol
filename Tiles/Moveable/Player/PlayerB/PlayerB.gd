extends "res://Tiles/Moveable/Player/Player.gd"

func _init() -> void:
	_movement_dictionary = {
		"player_up": Vector2.DOWN,
		"player_right": Vector2.LEFT,
		"player_down": Vector2.UP,
		"player_left": Vector2.RIGHT,
	}