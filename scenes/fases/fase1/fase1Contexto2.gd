extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):


func _on_ButtonJogar_pressed():
	get_tree().change_scene("res://scenes/game/Main.tscn")
	call_deferred("free")
