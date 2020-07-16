extends Area2D

const velocity: int = 4
const tile_size: int = 64
onready var ray = $RayCast2D
onready var tween = $Tween

func _ready():
	ray.set_collide_with_areas(true)

func move(direction: Vector2):
	if tween.is_active():
        return
	ray.cast_to = direction * tile_size
	ray.force_raycast_update()
	if ray.is_colliding():
		var collider = ray.get_collider()
		return handle_collision(collider, direction)
	else:
		move_tween(direction)
		return true
	return
	
func handle_collision(collider, direction: Vector2):
	if collider.is_in_group("Buttons"):
		move_tween(direction)
		return true
	elif collider.is_in_group("Boxes"):
		if collider.move(direction):
			move_tween(direction)
			return true
	return
				
func move_tween(direction):
	tween.interpolate_property(self, "position",
		position, position + direction * tile_size,
		1.0/velocity, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()