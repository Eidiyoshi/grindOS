extends Area2D

signal ConnectingRAM

signal ConnectRAMPort

var Data = [0, 0, 0, 0]

var holding = false
var isInsideRAM = false

var load_store = false

var connected = false

func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1 and isInsideRAM:
			holding = true
			emit_signal("ConnectingRAM",true)
		elif event.button_index == 1:
			if holding == true:
				holding = false
				emit_signal("ConnectingRAM",false)

func _process(delta):
	if connected:
		print(self.get_name())
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

func _on_RAM_mouse_entered():
	isInsideRAM = true

func _on_RAM_mouse_exited():
	isInsideRAM = false

func ConnectPortFunction(port):
	emit_signal("ConnectRAMPort",port)

func _on_PortA_Connect(port):
	ConnectPortFunction(port)

func _on_PortB_Connect(port):
	ConnectPortFunction(port)

func _on_PortC_Connect(port):
	ConnectPortFunction(port)


