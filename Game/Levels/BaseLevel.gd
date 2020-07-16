extends Node2D

const Box = preload("res://Tiles/Moveable/Box/Box.tscn")
const OpenDoor = preload("res://Tiles/Fixed/Door/OpenDoor.tscn")
const RedDoor = preload("res://Tiles/Fixed/Door/RedDoor.tscn")
const BlueDoor = preload("res://Tiles/Fixed/Door/BlueDoor.tscn")
const RedPressurePlate = preload("res://Tiles/Fixed/PressurePlate/RedPressurePlate.tscn")
const BluePressurePlate = preload("res://Tiles/Fixed/PressurePlate/BluePressurePlate.tscn")
const PlayerA = preload("res://Tiles/Moveable/Player/PlayerA/PlayerA.tscn")
const PlayerB = preload("res://Tiles/Moveable/Player/PlayerB/PlayerB.tscn")

const tile_size = 64

onready var TileMap = $TileMap

var redPressurePlates = []
var bluePressurePlates = []
var redDoors = []
var blueDoors = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print(" == INITIALIZED NEW LEVEL == ")

	for tile_xy in TileMap.get_used_cells():
		var tile_index = TileMap.get_cellv(tile_xy)
		var tile_name = TileMap.tile_set.tile_get_name(tile_index)
		
		if tile_name == "Wall":
			continue
		elif tile_name == "Box":
			var box = Box.instance()
			replace_tile(tile_xy, box)
		elif tile_name == "RedPressurePlate":
			var redPressurePlate = RedPressurePlate.instance()
			redPressurePlates.append(redPressurePlate)
			replace_tile(tile_xy, redPressurePlate)
		elif tile_name == "BluePressurePlate":
			var bluePressurePlate = BluePressurePlate.instance()
			bluePressurePlates.append(bluePressurePlate)
			replace_tile(tile_xy, bluePressurePlate)
		elif tile_name == "RedDoor":
			var redDoor = RedDoor.instance()
			redDoors.append(redDoor)
			replace_tile(tile_xy, redDoor)
		elif tile_name == "BlueDoor":
			var blueDoor = BlueDoor.instance()
			blueDoors.append(blueDoor)
			replace_tile(tile_xy, blueDoor)
		elif tile_name == "OpenDoor":
			var openDoor = OpenDoor.instance()
			replace_tile(tile_xy, openDoor)
		elif tile_name == "PlayerA":
			var playerA = PlayerA.instance()
			replace_tile(tile_xy, playerA)
		elif tile_name == "PlayerB":
			var playerB = PlayerB.instance()
			replace_tile(tile_xy, playerB)
		else:
			print("Found unknown tile " + tile_name + " at " + str(tile_xy))
	
	for redPressurePlate in redPressurePlates:
		for redDoor in redDoors:
			redPressurePlate.connect("isPressed", redDoor, "_on_Button_isPressed")
	for bluePressurePlate in bluePressurePlates:
		for blueDoor in blueDoors:
			bluePressurePlate.connect("isPressed", blueDoor, "_on_Button_isPressed")

func restart_level():
	get_parent().restart_level()

func replace_tile(tile_xy: Vector2, obj: Node2D):
	obj.set_position(TileMap.map_to_world(tile_xy))
	obj.set_position(obj.position.snapped(Vector2.ONE * tile_size))
	obj.set_position(obj.position + Vector2.ONE * tile_size/2)
	$Entities.add_child(obj)
	
	# Remove the placeholder tile
	TileMap.set_cellv(tile_xy, -1)
	
	print("Replaced tile at " + str(tile_xy) + " with " + str(obj.name))

func _input(event):
	if event.is_action_pressed('restart_level'):
		restart_level()