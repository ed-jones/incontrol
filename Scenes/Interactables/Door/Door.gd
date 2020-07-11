extends Node2D

var isOpen: bool = false

func _ready():
	pass # Replace with function body.

func openDoor():
	isOpen = true
	
func closeDoor():
	isOpen = false

func nextRoom():
	print("HERE")
