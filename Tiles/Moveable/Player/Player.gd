extends "res://Tiles/Moveable/Moveable.gd"

var enabled: bool = true

func handle_collision(collider, direction: Vector2):
	if collider.is_in_group("Doors"):
		if collider.isOpen:
			enabled = false
			$AudioCorrect.play()
			move_tween(direction)
		else:
			$AudioWrong.play()
			
	.handle_collision(collider, direction)

func _on_Tween_tween_all_completed():
	if !enabled:
		find_parent("Game").nextRoom()
		queue_free()