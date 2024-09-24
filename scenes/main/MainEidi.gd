extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var menu_recurso = load("res://scenes/menu/MenuScreen.tscn")
	var menu_instancia = menu_recurso.instance()
	add_child(menu_instancia)
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
