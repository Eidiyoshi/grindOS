extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_buttonCheck_pressed():
	if ($infosAltApagada.pressed or $comestivel.pressed or $grandeCap.pressed
	or $correr.pressed or $destruicao.pressed or $batatas.pressed ):
		$errou.popup()
	
	if($somenteLeitura.pressed and $naoVolatil.pressed and $infosImportantes.pressed):
		get_tree().change_scene("res://scenes/fases/fase2/turnOnScreen.tscn")
		call_deferred("free")
