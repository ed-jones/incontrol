extends Node2D

const levels: Array = [
	preload("res://Scenes/Game/Levels/Level1.tscn"),
	preload("res://Scenes/Game/Levels/Level2.tscn")
]

var nextRoomNumber: int = 0

func _ready():
	nextRoom()

func nextRoom():
	if (nextRoomNumber < len(levels)):
		if has_node("Level"): remove_child($Level)
		add_child(levels[nextRoomNumber].instance())
		nextRoomNumber+=1
	else:
		push_error("Tried to access a level that doesn't exist")
	
