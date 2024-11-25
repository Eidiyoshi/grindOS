extends Area2D

signal Connect

var RNG = RandomNumberGenerator.new()

var isInsideProcess = false

var Data = [0, 0, 0, 0]

var connected = false

var Dificulty = 10

var tick = 0

var max_tries = 5

var CPU

func spawn():
	var Max = PlayerData.level * Dificulty
	var Min = (PlayerData.level - 1) * Dificulty
	for i in Data.size() - 1:
		Data[i] = RNG.randi_range(Min, Max)

func process(aux):
	if !CPU.Full():
		Data[aux] -= 1
		if aux != 3:
			CPU.Data[aux] += 1
		var total = 0
		for i in Data.size() - 1:
			total += Data[i]
		if total == 0:
			spawn()
	
		
func _process(delta):
	if connected:
		tick += 1
		if tick == PlayerData.processTick:
			tick = 0
			var aux = RNG.randi_range(0,2)
			var flag = 0
			while Data[aux] == 0 and max_tries >= flag:
				aux = RNG.randi_range(0,2)
				flag += 1
			if Data[aux] > 0:
				process(aux)
	else:
		tick = 0

func _ready():
	CPU = get_parent().get_parent().get_node("CPU")
	RNG.randomize()
	var Max = PlayerData.level * Dificulty
	var Min = (PlayerData.level - 1) * Dificulty
	for i in Data.size() - 1:
		Data[i] = RNG.randi_range(Min, Max)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if isInsideProcess:
				emit_signal("Connect",self)

func _on_Process_mouse_entered():
	isInsideProcess = true

func _on_Process_mouse_exited():
	isInsideProcess = false

