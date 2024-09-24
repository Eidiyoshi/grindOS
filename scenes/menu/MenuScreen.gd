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


func _on_Button_pressed():
	
	var next_level_resource = load("res://scenes/menu/AvisoCreditos.tscn")
	var next_level = next_level_resource.instance()
	get_parent().add_child(next_level)
	
	call_deferred("free")

