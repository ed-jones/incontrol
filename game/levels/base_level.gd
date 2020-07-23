class_name BaseLevel
extends Node2D

signal is_loaded()

const TILE_SIZE := 16

var _tile_dictionary := {
	"Box": preload("res://tiles/moveable/box/box.tscn"),
	"OpenDoor": preload("res://tiles/fixed/door/open_door/open_door.tscn"),
	"RedDoor": preload("res://tiles/fixed/door/red_door/red_door.tscn"),
	"BlueDoor": preload("res://tiles/fixed/door/blue_door/blue_door.tscn"),
	"RedPressurePlate": preload("res://tiles/fixed/button/red_button/red_button.tscn"),
	"BluePressurePlate": preload("res://tiles/fixed/button/blue_button/blue_button.tscn"),
	"PlayerA": preload("res://tiles/moveable/player/player_a/player_a.tscn"),
	"PlayerB": preload("res://tiles/moveable/player/player_b/player_b.tscn"),
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