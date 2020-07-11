extends Node

const TILE = preload("res://Scenes/Tiles/Tile.tscn")
onready var TILE_WIDTH: float = TILE.instance().get_size().x
onready var TILE_HEIGHT: float = TILE.instance().get_size().y
onready var VIEWPORT_WIDTH: float = get_viewport().size.x
onready var VIEWPORT_HEIGHT: float = get_viewport().size.y

func _ready():
	generateOuterWall()

func generateOuterWall():
	# TOP
	for i in round(VIEWPORT_WIDTH/TILE_WIDTH)-2:
		generateTile(Vector2(i*TILE_WIDTH+TILE_WIDTH*3/2, TILE_HEIGHT/2))
		
	#BOTTOM
	for i in round(VIEWPORT_WIDTH/TILE_WIDTH)-2:
		generateTile(Vector2(i*TILE_WIDTH+TILE_WIDTH*3/2, VIEWPORT_HEIGHT-TILE_HEIGHT/2))
		
	#LEFT
	for i in round(VIEWPORT_HEIGHT/TILE_HEIGHT-2):
		generateTile(Vector2(TILE_WIDTH/2, i*TILE_HEIGHT+TILE_HEIGHT*3/2))
		
	#RIGHT
	for i in round(VIEWPORT_HEIGHT/TILE_HEIGHT-2):
		generateTile(Vector2(VIEWPORT_WIDTH-TILE_WIDTH/2, i*TILE_HEIGHT+TILE_HEIGHT*3/2))
		
	#CORNERS
	generateTile(Vector2(TILE_WIDTH/2, TILE_HEIGHT/2))
	generateTile(Vector2(TILE_WIDTH/2, VIEWPORT_HEIGHT-TILE_HEIGHT/2))
	generateTile(Vector2(VIEWPORT_WIDTH-TILE_WIDTH/2, TILE_HEIGHT/2))
	generateTile(Vector2(VIEWPORT_WIDTH-TILE_WIDTH/2, VIEWPORT_HEIGHT-TILE_HEIGHT/2))

func generateTile(position: Vector2):
	var tile = TILE.instance()
	tile.set_position(position)
	self.add_child(tile)