extends Control

@onready var corruption_label = $Label

func set_corruption(value: int):
	corruption_label.text = str(value)
