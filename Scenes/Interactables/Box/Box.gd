extends RigidBody2D
var target_pos: Vector2

func _physics_process(delta):
	if abs(position.distance_to(target_pos)) <= 3:
		apply_central_impulse(-linear_velocity)


func _on_Box_body_entered(body):
	if body.is_in_group("Players"):
		target_pos = position + linear_velocity.normalized()*64