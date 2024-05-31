extends CharacterBody2D

@export var speed: int
@export var fire_force: int
@export var damage_multiplier: float
@export var prayer_force: int
@onready var gun = $Gun
@onready var is_in_altar: bool = false

@export var prayer_time: float
var current_prayer_duration = 0

signal rezo_completo(fuerza)

func _process(delta):
	move()
	if Input.is_action_just_pressed("fire"):
		gun.fire_gun(velocity.normalized(), fire_force, damage_multiplier)
		
	if Input.is_action_pressed("pray") and is_in_altar:
		pray(delta)
	var mouse = get_global_mouse_position()
	var is_right = (mouse.x - global_position.x) < 0
	$Sprite2D.flip_h = is_right
	gun.flip_v = is_right
	
	move_and_slide()

func move():
	var direction = Vector2.ZERO
	var x = Input.get_axis("move_left", "move_right")
	var y = Input.get_axis("move_up", "move_down")
	
	direction = Vector2(x, y).normalized()
	velocity = direction * speed
	
func pray(delta):
	current_prayer_duration += delta
	if current_prayer_duration >= prayer_time:
		current_prayer_duration = 0
		rezo_completo.emit(prayer_force)
	
func set_is_in_altar(value):
	is_in_altar = value
	if not is_in_altar:
		current_prayer_duration = 0
