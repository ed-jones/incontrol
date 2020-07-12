extends Area2D
onready var tween = $Tween
const tile_size = 64
const velocity: int = 4
#var target_pos: Vector2
#
#func _physics_process(delta):
#	if abs(position.distance_to(target_pos)) <= 3:
#		apply_central_impulse(-linear_velocity)
#
#
#func _on_Box_body_entered(body):
#	if body.is_in_group("Players"):
#		target_pos = position + linear_velocity.normalized()*64
#
		
func push(direction):
	if tween.is_active():
        return
	tween.interpolate_property(self, "position",
		position, position + direction * tile_size,
		1.0/velocity, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
