extends "res://Scenes/Player/Player.gd"

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed('player_up'):
		move_down()
	if Input.is_action_just_released('player_up'):
		cancel_down()
	if Input.is_action_just_pressed('player_right'):
		move_left()
	if Input.is_action_just_released('player_right'):
		cancel_left()
	if Input.is_action_just_pressed('player_down'):
		move_up()
	if Input.is_action_just_released('player_down'):
		cancel_up()
	if Input.is_action_just_pressed('player_left'):
		move_right()
	if Input.is_action_just_released('player_left'):
		cancel_right()
