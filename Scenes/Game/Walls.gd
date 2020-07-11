extends Node

const WALL = preload("res://Scenes/Tiles/Tile.tscn")
const TILE_WIDTH: float = 64.0
const TILE_HEIGHT: float = 64.0
onready var VIEWPORT_WIDTH: float = get_viewport().size.x
onready var VIEWPORT_HEIGHT: float = get_viewport().size.y

func _ready():
	# TOP
	for i in round(float(VIEWPORT_WIDTH)/TILE_WIDTH)-2:
		generateWall(Vector2(i*TILE_WIDTH+TILE_WIDTH*3/2, TILE_HEIGHT/2))
		
	#BOTTOM
	for i in round(VIEWPORT_WIDTH/TILE_WIDTH)-2:
		generateWall(Vector2(i*TILE_WIDTH+TILE_WIDTH*3/2, VIEWPORT_HEIGHT-TILE_HEIGHT/2))
		
	#LEFT
	for i in round(VIEWPORT_HEIGHT/TILE_HEIGHT-2):
		generateWall(Vector2(TILE_WIDTH/2, i*TILE_HEIGHT+TILE_HEIGHT*3/2))
		
	#RIGHT
	for i in round(VIEWPORT_HEIGHT/TILE_HEIGHT-2):
		generateWall(Vector2(VIEWPORT_WIDTH-TILE_WIDTH/2, i*TILE_HEIGHT+TILE_HEIGHT*3/2))
		
	#CORNERS
	generateWall(Vector2(TILE_WIDTH/2, TILE_HEIGHT/2))
	generateWall(Vector2(TILE_WIDTH/2, VIEWPORT_HEIGHT-TILE_HEIGHT/2))
	generateWall(Vector2(VIEWPORT_WIDTH-TILE_WIDTH/2, TILE_HEIGHT/2))
	generateWall(Vector2(VIEWPORT_WIDTH-TILE_WIDTH/2, VIEWPORT_HEIGHT-TILE_HEIGHT/2))
	
	
func generateWall(position: Vector2):
	var wall = WALL.instance()
	wall.set_position(position)
	self.add_child(wall)