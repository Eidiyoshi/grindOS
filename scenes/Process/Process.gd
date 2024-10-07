extends Area2D

signal Connect

var ConnectedCPU = false
var isInsideProcess = false

func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and isInsideProcess:
			emit_signal("Connect")

func _on_Process_mouse_entered():
	isInsideProcess = true

func _on_Process_mouse_exited():
	isInsideProcess = false
