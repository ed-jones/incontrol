class_name Game
extends Node2D

const levels: Array = [
	preload("res://game/levels/level1.tscn"),
	preload("res://game/levels/level2.tscn"),
	preload("res://game/levels/level3.tscn"),
	preload("res://game/levels/level4.tscn"),
	preload("res://game/levels/level5.tscn"),
	preload("res://game/levels/level6.tscn"),
	preload("res://game/levels/level7.tscn"),
	preload("res://game/levels/level8.tscn"),
	preload("res://game/levels/level9.tscn"),
	preload("res://game/levels/level10.tscn"),
]

const GAME_OVER = preload("res://game/menu/game_over.tscn")

var current_room := 0
var current_level: BaseLevel


func _ready() -> void:
	init_room()
	if not OS.is_debug_build():
		$AudioStreamPlayer.play()


func init_room() -> void:
	add_room(current_room)
	
	
func next_room() -> void:
	change_room(current_room + 1)


func prev_room() -> void:
	change_room(current_room - 1)


func change_room(new_room: int) -> void:
	if new_room >= 0 and new_room <= len(levels):
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