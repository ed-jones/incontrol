class_name Door
extends Fixed

var is_open: bool = false

func _ready() -> void:
	var level: BaseLevel = find_parent("Level")
	level.connect("is_loaded", self, "_on_level_is_loaded")

func _connect_to_button() -> void:
	for sibling in get_parent().get_children():
		if sibling as PressurePlate:
			if sibling.get_color() == get_color():
				sibling.connect("is_pressed", self, "_on_button_is_pressed")


func open_door() -> void:
	is_open = true
	$Sprite.set_animation("open")


func close_door() -> void:
	is_open = false
	$Sprite.set_animation("closed")

func _on_level_is_loaded() -> void:
	_connect_to_button()	

func _on_button_is_pressed(is_pressed) -> void:
	if is_pressed:
		open_door()
	else:
		close_door()