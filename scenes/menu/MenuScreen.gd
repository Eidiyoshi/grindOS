extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var flag = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(flag):
		$comecarImg.modulate.a -= 0.5 * delta


func _on_ButtonCreditos_pressed():
	get_tree().change_scene("res://scenes/menu/creditos/AvisoCreditos.tscn")
	
	call_deferred("free")

func _on_ButtonSair_pressed():
	get_tree().quit()



func _on_ButtonJogar_pressed():
	get_tree().change_scene("res://scenes/fases/fase1/fase1Contexto2.tscn") # Replace with function body.
	call_deferred("free")


func _on_comecar_pressed():
	flag = 1
	$comecar.visible = 0