extends Node2D

@onready var fireballs : Node2D = $Fireballs
@onready var gun = $Player/Gun
@onready var altar = $Map/Altar
@onready var player = $Player
@onready var rosario_ui = $HUD/Rosario
@onready var corruption_ui = $HUD/Corruption
@onready var mundo = $Mundo

var max_corruption = 20

var bolitas: int = 0
var num_bolitas_rosario = 53
var rosarios_completos: int = 0

func _ready():
	init_signals()
	init_ui()

func init_ui():
	rosario_ui.set_bolita(0)
	rosario_ui.set_rosarios(0)
	corruption_ui.set_corruption(0)

func init_signals():
	player.rezo_completo.connect(_on_prayer_was_completed)
	gun.shoot.connect(_on_gun_was_fired)
	altar.body_entered.connect(_on_player_area_entered)
	altar.body_exited.connect(_on_player_area_exited)
	mundo.corruption_increased.connect(_on_world_corruption_increased)
	
func _on_gun_was_fired(fireball_instance, direction, damage_multiplier):
	fireball_instance.fire(direction, damage_multiplier)
	fireball_instance.global_position = gun.global_position
	fireballs.add_child(fireball_instance)
	
func _on_player_area_entered(_body):
	player.set_is_in_altar(true)

func _on_player_area_exited(_body):
	player.set_is_in_altar(false)

func _on_prayer_was_completed(prayer_force):
	bolitas+= 1
	rosario_ui.set_bolita(bolitas)
	if bolitas == num_bolitas_rosario:
		rosarios_completos += 1
		rosario_ui.set_rosarios(rosarios_completos)
		bolitas = 0
		rosario_ui.set_bolita(bolitas)
	mundo.set_corruption(-prayer_force)


func _on_world_corruption_increased(current_corruption: int):
	corruption_ui.set_corruption(current_corruption)
	if current_corruption == max_corruption:
		print("Game Over")
	
