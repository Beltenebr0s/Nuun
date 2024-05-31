extends Control

@onready var bolitas = $Bolitas
@onready var rosarios = $RosariosCompletos

func set_bolita(num_bolitas):
	bolitas.text = "BOLITAS: " + str(num_bolitas)
	
func set_rosarios(num_rosarios):
	rosarios.text = "ROSARIOS: " + str(num_rosarios)
	
