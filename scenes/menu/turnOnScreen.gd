extends Node2D


# Declare member variables here. Examples:
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):


func _on_ButtonLigar_mouse_entered():
	$BotaoAtivo.visible = true # Replace with function body.


func _on_ButtonLigar_mouse_exited():
	$BotaoAtivo.visible = false
