extends Area2D

signal isPressed(isPressed)

func _on_PressurePlate_area_entered(_area):
	emit_signal('isPressed', true)
	$AudioStreamPlayer.play()
	$Sprite.set_animation("pressed")


func _on_PressurePlate_area_exited(_area):
	emit_signal('isPressed', false)
	$Sprite.set_animation("released")
