extends Node2D

var isOpen: bool = false

func openDoor():
	isOpen = true
	$Sprite.set_animation("open")

func closeDoor():
	isOpen = false
	$Sprite.set_animation("closed")

func _on_Button_isPressed(isPressed):
	if isPressed:
		openDoor()
	else:
		closeDoor()
