extends StaticBody2D

var isPressed: bool = false

func press():
	isPressed = true

func release():
	isPressed = false
