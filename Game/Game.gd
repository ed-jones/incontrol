class_name Game
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

const GAME_OVER = preload("res://Game/Menu/GameOver.tscn")

var current_room := 0
var current_level: BaseLevel

func _ready() -> void:
	init_room()
	if not OS.is_debug_build():
		$AudioStreamPlayer.start()

func init_room() -> void:
	add_room(current_room)
	
	
func next_room() -> void:
	change_room(current_room + 1)


func prev_room() -> void:
	change_room(current_room - 1)


func change_room(new_room: int) -> void:
	if new_room >= 0 and new_room < len(levels):
		remove_room()
		add_room(new_room)
		current_room = new_room
	else:
		print("Tried to access a room out of bounds")


func add_room(roomNum) -> void:
	if roomNum < len(levels):
		current_level = levels[roomNum].instance()
		add_child(current_level)
	else:
		add_child(GAME_OVER.instance())


func remove_room() -> void:
	if has_node("Level"): 
		remove_child($Level)


func has_players() -> bool:
	for entity in current_level.get_node("Entities").get_children():
		if (entity as Player):
			if entity.enabled:
				return true
	return false
	
	
func restart_level() -> void:
	if has_node("Level"): 
		remove_child($Level)
	add_room(current_room)
	
func _input(event) -> void:
	var just_pressed = event.is_pressed() and not event.is_echo()
	if event.is_action_pressed('restart_level') and just_pressed:
		restart_level()
	if OS.is_debug_build():
		if event.is_action_pressed('next_room') and just_pressed:
			next_room()
		elif event.is_action_pressed('prev_room') and just_pressed:
			prev_room()