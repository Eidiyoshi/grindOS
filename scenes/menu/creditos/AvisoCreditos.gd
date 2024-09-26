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


func _on_ButtonContinuar_pressed():
	get_tree().change_scene("res://scenes/menu/creditos/CenaDeCreditos.tscn")
	call_deferred("free")

func _on_ButtonVoltar_pressed():
	get_tree().change_scene("res://scenes/menu/MenuScreen.tscn")
	call_deferred("free")
