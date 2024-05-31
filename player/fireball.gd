extends Area2D

var direction = Vector2.ZERO
var damage_value = 1

func _process(delta):
	global_position += direction * delta
	pass
	
func fire(new_direction: Vector2, damage_multiplier: float):
	direction = new_direction
	damage_value *= damage_multiplier

func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("enemy"):
		area.damage(damage_value)
	queue_free()
