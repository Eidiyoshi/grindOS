extends Area2D

signal ConnectRAM
signal ConnectingRAM

var holding = false
var isInsideRAM = false

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
			if isInsideRAM:
				emit_signal("ConnectRAM",self)

func _process(delta):
	if holding:
		var mouse_pos = get_local_mouse_position()
		$Cable.position = Vector2((mouse_pos.x)/2,(mouse_pos.y)/2)
		$Cable.rotation_degrees = atan2(mouse_pos.y,mouse_pos.x)
		$Cable.rotation = $Cable.rotation_degrees
		$Cable.scale.x = sqrt(mouse_pos.x * mouse_pos.x + mouse_pos.y * mouse_pos.y)/180

func _on_RAM_mouse_entered():
	isInsideRAM = true

func _on_RAM_mouse_exited():
	isInsideRAM = false
