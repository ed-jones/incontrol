extends KinematicBody2D

var velocity: float = 180
var direction: Vector2
var target_pos: Vector2
var push = 80

func _physics_process(delta):
	if position.distance_to(target_pos) > 1:
        var _collision = move_and_collide(direction*velocity*delta)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * push)
		if collision.collider.is_in_group("Doors"):
			collision.collider.nextRoom()

func move(_direction):
	direction = _direction
	target_pos = position + direction*64
