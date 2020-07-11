extends Node2D

var isOpen: bool = false

func openDoor():
	isOpen = true

func closeDoor():
	isOpen = false

func nextRoom():
	print("Touched Door")
	if isOpen:
		find_parent("Game").nextRoom()

func _on_Button_isPressed(isPressed):
	print("BUTTON PRESSED")
	if isPressed:
		openDoor()
	else:
		closeDoor()
