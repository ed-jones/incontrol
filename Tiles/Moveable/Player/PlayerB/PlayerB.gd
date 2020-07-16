extends "res://Tiles/Moveable/Player/Player.gd"

func _process(_delta):
	if Input.is_action_pressed('player_up'):
		move(Vector2.DOWN)
	if Input.is_action_pressed('player_right'):
		move(Vector2.LEFT)
	if Input.is_action_pressed('player_down'):
		move(Vector2.UP)
	if Input.is_action_pressed('player_left'):
		move(Vector2.RIGHT)