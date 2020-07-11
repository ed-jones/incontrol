extends "res://Scenes/Interactables/Interactable.gd"

onready var Body = $Body

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Body_body_entered(by_body):
	print("Body entered: " + by_body)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
