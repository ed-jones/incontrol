extends Node2D

const Box = preload("res://Scenes/Interactables/Box.tscn")

onready var TileMap = $TileMap

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
		elif tile_name == "PressurePlate":
			continue
		elif tile_name == "Door":
			continue
		else:
			print("Found unknown tile " + tile_name + " at " + str(tile_xy))

func replace_tile(tile_xy: Vector2, obj: Node2D):
	obj.set_position(TileMap.map_to_world(tile_xy))
	$Entities.add_child(obj)
	
	# Remove the placeholder tile
	TileMap.set_cellv(tile_xy, -1)
	
	print("Replaced tile at " + str(tile_xy) + " with " + str(obj.name))

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
