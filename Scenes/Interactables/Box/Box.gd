extends RigidBody2D

func _on_Box_body_entered(body):
	if body.has_method("press"):
		body.press()

func _on_Box_body_exited(body):
	if body.has_method("release"):
		body.release()
