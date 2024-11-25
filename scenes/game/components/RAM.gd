extends Area2D

signal ConnectingRAM

signal ConnectRAMPort

#           A  B  C  Trash 
var Data = [0, 0, 0, 0]

var holding = false
var isInsideRAM = false

var load_store = false

var connected = false

var SecondaryMemory

var tick = 0

var max_tries = 5

var RNG = RandomNumberGenerator.new()

func _ready():
	SecondaryMemory = get_parent().get_node("SecondaryMemory")

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1 and isInsideRAM:
			holding = true
			emit_signal("ConnectingRAM",true)
		elif event.button_index == 1:
			if holding == true:
				holding = false
				emit_signal("ConnectingRAM",false)

func process(aux):
	if !SecondaryMemory.Full():
		Data[aux] -= 1
		SecondaryMemory.Data[aux] += 1

func _process(delta):
	$Sprite/StorageDisplay.updateBar(Data)
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
	if holding:
		var mouse_pos = get_local_mouse_position()
		$Cable.position = Vector2((mouse_pos.x)/2,(mouse_pos.y)/2)
		$Cable.rotation_degrees = atan2(mouse_pos.y,mouse_pos.x)
		$Cable.rotation = $Cable.rotation_degrees
		$Cable.scale.x = sqrt(mouse_pos.x * mouse_pos.x + mouse_pos.y * mouse_pos.y)/180

func Full():
	var total = 0
	for i in Data.size() - 1:
		total += Data[i]
	if total == PlayerData.maxStorageRAM:
		return true
	else:
		return false

func ConnectPortFunction(port):
	emit_signal("ConnectRAMPort",port)

func _on_PortA_Connect(port):
	ConnectPortFunction(port)

func _on_PortB_Connect(port):
	ConnectPortFunction(port)

func _on_PortC_Connect(port):
	ConnectPortFunction(port)

func _on_StorageDisplay_in_Ui():
	isInsideRAM = true

func _on_StorageDisplay_out_Ui():
	isInsideRAM = false
