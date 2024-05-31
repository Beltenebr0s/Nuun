extends Area2D

@export var max_health = 5
var current_health = max_health

func damage(value):
	current_health -= value
	if current_health <= 0:
		queue_free()
