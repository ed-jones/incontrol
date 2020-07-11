extends StaticBody2D

func get_size():
	return get_node("Sprite").texture.get_size()
