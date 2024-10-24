extends Area2D

signal ConnectingCPU

var isInsideCPU = false
var holding = false

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1 and isInsideCPU:
			holding = true
			emit_signal("ConnectingCPU",true)
		elif event.button_index == 1 and holding == true:
			holding = false
			emit_signal("ConnectingCPU",false)

func _process(delta):
	if holding:
		var mouse_pos = get_local_mouse_position()
		$Cable.position = Vector2((mouse_pos.x)/2,(mouse_pos.y)/2)
		$Cable.rotation_degrees = atan2(mouse_pos.y,mouse_pos.x)
		$Cable.rotation = $Cable.rotation_degrees
		$Cable.scale.x = sqrt(mouse_pos.x * mouse_pos.x + mouse_pos.y * mouse_pos.y)/180

func _on_CPU_mouse_entered():
	isInsideCPU = true

func _on_CPU_mouse_exited():
	isInsideCPU = false
