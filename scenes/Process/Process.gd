extends Area2D

signal Connect
signal CancelConnect

var RNG = RandomNumberGenerator.new()

var isInsideProcess = false

var Data = [0, 0, 0]

func _ready():
	RNG.randomize()
	for i in 3:
		Data[i] = RNG.randi_range(0,20)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if isInsideProcess:
				emit_signal("Connect",self)
			else:
				emit_signal("CancelConnect")

func _on_Process_mouse_entered():
	isInsideProcess = true

func _on_Process_mouse_exited():
	isInsideProcess = false
