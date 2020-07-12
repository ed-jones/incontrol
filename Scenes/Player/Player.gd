extends Area2D

const velocity: int = 4
var direction: Vector2
var target_pos: Vector2
var push = 80
const tile_size = 64
onready var ray = $RayCast2D
onready var tween = $Tween

#func _physics_process(delta):
#	if position.distance_to(target_pos) > 1:
#        var _collision = move_and_collide(direction*velocity*delta)
#
#	for index in get_slide_count():
#		var collision = get_slide_collision(index)
#		if collision.collider.is_in_group("Doors"):
#			collision.collider.nextRoom()


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	ray.set_collide_with_areas(true)

func move(direction):
	if tween.is_active():
        return
	ray.cast_to = direction * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		move_tween(direction)
	else:
		var collider = ray.get_collider()
		if collider.is_in_group("bodies"):
			collider.push(direction)
			move_tween(direction)
		
func move_tween(direction):
	tween.interpolate_property(self, "position",
		position, position + direction * tile_size,
		1.0/velocity, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	
