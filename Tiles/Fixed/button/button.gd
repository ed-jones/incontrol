class_name PressurePlate
extends Fixed

signal is_pressed(is_pressed)


func _on_PressurePlate_area_entered(_area) -> void:
	emit_signal('is_pressed', true)
	$AudioStreamPlayer.play()
	$Sprite.set_animation("pressed")


func _on_PressurePlate_area_exited(_area) -> void:
	emit_signal('is_pressed', false)
	$Sprite.set_animation("released")