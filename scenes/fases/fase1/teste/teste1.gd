extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fonteAtivo;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_fonte_pressed():
	fonteAtivo = 1;
	get_parent().color = Color(0, 0, 1 , 1);
	

func getAtividade():
	return fonteAtivo;
