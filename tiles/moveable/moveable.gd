class_name Moveable
extends Area2D

const velocity := 4.0
const tile_size := 64

onready var ray: RayCast2D = $RayCast2D
onready var tween: Tween = $Tween


func _ready() -> void:
	ray.set_collide_with_areas(true)


func move(direction: Vector2) -> bool:
	if tween.is_active():
        return false

	ray.cast_to = direction * tile_size
	ray.force_raycast_update()
	if ray.is_colliding():
		var collider = ray.get_collider()
		return handle_collision(collider, direction)
		
	else:
		move_tween(direction)
		return true


func handle_collision(collider: Node2D, direction: Vector2) -> bool:
	if collider.is_in_group("Buttons"):
		move_tween(direction)
		return true
	if collider.is_in_group("Players"):
		move_tween(direction)
		return true
	elif collider.is_in_group("Boxes"):
		if collider.move(direction):
			move_tween(direction)
			return true
	return false


func move_tween(direction) -> void:
	if tween.interpolate_property(self, "position",
			position, position + direction * tile_size,
			1.0/velocity, Tween.TRANS_SINE, Tween.EASE_IN_OUT):
		_play_move_sound()
	else:
		print("Unable to interpolate property")
	if not tween.start():
		print("Unable to start tween")


func stop() -> void:
	#is_moving = false
	pass

func _play_move_sound():
	return

func _on_Tween_tween_all_completed() -> void:
	pass
#	if is_moving:
#		var _can_move := move(last_direction)

