extends Area2D

signal isPressed(isPressed)
	
func _on_PressurePlate_body_entered(_body):
	emit_signal('isPressed', true)

func _on_PressurePlate_body_exited(_body):
	emit_signal('isPressed', false)
