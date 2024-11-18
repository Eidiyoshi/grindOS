extends Area2D

signal Connect

var isInsidePort = false

var connected = false

var Tick = 0

var Storage = get_parent()

func _ready():
	#portTick = PlayerData.getPortTick()
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if isInsidePort:
				emit_signal("Connect",self)

func _on_Port_mouse_entered():
	isInsidePort = true

func _on_Port_mouse_exited():
	isInsidePort = false
