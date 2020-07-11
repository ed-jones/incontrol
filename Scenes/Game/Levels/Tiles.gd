extends "res://Scenes/Game/Tiles.gd"

func _ready():
	generateInnerWalls()

func generateInnerWalls():
	for i in round(VIEWPORT_WIDTH/TILE_WIDTH)-2:
		generateTile(Vector2(i*TILE_WIDTH+TILE_WIDTH*3/2, VIEWPORT_HEIGHT/2))