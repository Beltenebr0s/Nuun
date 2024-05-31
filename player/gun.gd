extends AnimatedSprite2D

@onready var fireball_scene = preload("res://player/fireball.tscn")

signal shoot(fireball)

func fire_gun(direction: Vector2, fire_force: int, damage_multiplier: float):
	var fireball_instance = fireball_scene.instantiate()
	$Explosion.emitting = true
	shoot.emit(fireball_instance, direction * fire_force, damage_multiplier)
	
