class_name BaseLevel
extends Node2D

signal is_loaded()

const TILE_SIZE := 64

var _tile_dictionary := {
	"Box": preload("res://Tiles/Moveable/Box/Box.tscn"),
	"OpenDoor": preload("res://Tiles/Fixed/Door/OpenDoor/OpenDoor.tscn"),
	"RedDoor": preload("res://Tiles/Fixed/Door/RedDoor/RedDoor.tscn"),
	"BlueDoor": preload("res://Tiles/Fixed/Door/BlueDoor/BlueDoor.tscn"),
	"RedPressurePlate": preload("res://Tiles/Fixed/PressurePlate/RedPressurePlate/RedPressurePlate.tscn"),
	"BluePressurePlate": preload("res://Tiles/Fixed/PressurePlate/BluePressurePlate/BluePressurePlate.tscn"),
	"PlayerA": preload("res://Tiles/Moveable/Player/PlayerA/PlayerA.tscn"),
	"PlayerB": preload("res://Tiles/Moveable/Player/PlayerB/PlayerB.tscn"),
}

onready var _tile_map: TileMap = $TileMap
onready var _entities: Node2D = $Entities


func _ready() -> void:
	_init_level()


func _init_level() -> void:
	for tile_xy in _tile_map.get_used_cells():
		var tile_index := _tile_map.get_cellv(tile_xy)
		var tile_name := _tile_map.tile_set.tile_get_name(tile_index)
		if tile_name == "Wall":
			pass
		elif tile_name in _tile_dictionary:
			var new_tile = _tile_dictionary[tile_name].instance()
			replace_tile(tile_xy, new_tile)
		else:
			print("Found unknown tile ", tile_name, " at ", str(tile_xy))
	emit_signal('is_loaded')


func replace_tile(tile_xy: Vector2, obj: Node2D) -> void:
	obj.set_position(_tile_map.map_to_world(tile_xy))
	obj.set_position(obj.position + Vector2.ONE * TILE_SIZE/2)
	_entities.add_child(obj)
	_tile_map.set_cellv(tile_xy, -1) # Remove the placeholder tile