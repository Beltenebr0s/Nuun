extends Node

@onready var current_corruption = 0
@onready var corruption_timer = $CorruptionTimer

signal corruption_increased(_corruption)

func _on_corruption_timer_timeout():
	set_corruption(1)
	
func set_corruption(value: int):
	current_corruption += value
	if current_corruption < 0:
		current_corruption = 0
	corruption_increased.emit(current_corruption)
