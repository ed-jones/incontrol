class_name Fixed
extends Node2D

enum Colors {
	BLUE,
	RED,
}

var _color: int

func get_color() -> int:
	return _color
	
func set_color(color) -> void:
	_color = color