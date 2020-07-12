extends Area2D
onready var tween = $Tween
const tile_size = 64
const velocity: int = 4
onready var ray = $RayCast2D

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func push(direction: Vector2):
	if tween.is_active():
        return false
	ray.cast_to = direction * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		tween.interpolate_property(self, "position",
			position, position + direction * tile_size,
			1.0/velocity, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		$AudioStreamPlayer.play()
		return true
	return false