extends Area2D

const velocity: int = 4
const tile_size = 64
onready var ray = $RayCast2D
onready var tween = $Tween
var enabled = true

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	ray.set_collide_with_areas(true)

func move(direction: Vector2):
	if tween.is_active():
        return
	ray.cast_to = direction * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		move_tween(direction)
	else:
		var collider = ray.get_collider()
		if collider.is_in_group("bodies"):
			if collider.push(direction):
				move_tween(direction)
		elif collider.is_in_group("Doors"):
			if collider.isOpen:
				enabled = false
				queue_free()
				collider.nextRoom()

func move_tween(direction):
	tween.interpolate_property(self, "position",
		position, position + direction * tile_size,
		1.0/velocity, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	