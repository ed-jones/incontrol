extends StaticBody2D

signal isPressed(isPressed)

func _ready():
	pass

func press():
	emit_signal('isPressed', true)

func release():
	emit_signal('isPressed', false)
