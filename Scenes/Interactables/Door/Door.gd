extends Node2D

var isOpen: bool = false

func openDoor():
	isOpen = true
	$Sprite.set_animation("open")

func closeDoor():
	isOpen = false
	$Sprite.set_animation("close")

func nextRoom():
	if isOpen:
		find_parent("Game").nextRoom()

func _on_Button_isPressed(isPressed):
	if isPressed:
		openDoor()
	else:
		closeDoor()
