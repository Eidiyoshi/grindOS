extends Area2D

signal Connect

var RNG = RandomNumberGenerator.new()

var isInsideProcess = false

var Data = [0, 0, 0, 0]

var Max = 20
var Min = 0

func _ready():
	RNG.randomize()
	var total = 0
	for i in Data.size() - 2:
		Data[i+1] = RNG.randi_range(Min, Max)
		total += Data[i+1]
	total += RNG.randi_range(Min, Max)
	Data[0] = total

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if isInsideProcess:
				emit_signal("Connect",self)

func _on_Process_mouse_entered():
	isInsideProcess = true

func _on_Process_mouse_exited():
	isInsideProcess = false

