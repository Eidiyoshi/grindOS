extends Area2D

signal Connect
signal CancelConnect

var isInsideDataA = false
var AStored = 0

func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if isInsideDataA:
				emit_signal("Connect",self)
			else:
				emit_signal("CancelConnect")

func _on_DataA_mouse_entered():
	isInsideDataA = true

func _on_DataA_mouse_exited():
	isInsideDataA = false
