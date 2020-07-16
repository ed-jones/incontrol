extends Node2D

const levels: Array = [
	preload("res://Game/Levels/Level1.tscn"),
	preload("res://Game/Levels/Level2.tscn"),
	preload("res://Game/Levels/Level3.tscn"),
	preload("res://Game/Levels/Level4.tscn"),
	preload("res://Game/Levels/Level5.tscn"),
	preload("res://Game/Levels/Level6.tscn"),
	preload("res://Game/Levels/Level7.tscn"),
	preload("res://Game/Levels/Level8.tscn"),
	preload("res://Game/Levels/Level9.tscn"),
	preload("res://Game/Levels/Level10.tscn"),
]

const GAMEOVER = preload("res://Game/Menu/GameOver.tscn")

var currentRoom: int = 1
var currentLevel: Object

func _ready():
	initRoom()

func initRoom():
	addRoom(0)
	
func nextRoom():
	if isRoomEmpty():
		currentRoom+=1
		if has_node("Level"): remove_child($Level)
		addRoom(currentRoom)
		
func addRoom(roomNum):
	if (roomNum < len(levels)):
		currentLevel = levels[roomNum].instance()
		add_child(currentLevel)
	else:
		add_child(GAMEOVER.instance())
		
func isRoomEmpty():
	for node in ["Entities/PlayerA", "Entities/PlayerB"]:
		if currentLevel.has_node(node):
			if currentLevel.get_node(node).enabled:
				return false
	return true
	
func restart_level():
	if has_node("Level"): remove_child($Level)
	addRoom(currentRoom)