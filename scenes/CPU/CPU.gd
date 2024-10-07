extends Area2D

signal Connecting

var connected = false
var isInsideCPU = false
var holding = false

func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1 and isInsideCPU:
			holding = true
			emit_signal("Connecting")
			$CPUMouseArea.visible = true	
		elif event.button_index == 1:
			holding = false

func _process(delta):
	var mouse_pos = get_local_mouse_position()
	if holding:
		$Cable.position = Vector2((mouse_pos.x)/2,(mouse_pos.y)/2)
		$Cable.rotation_degrees = atan2(mouse_pos.y,mouse_pos.x)
		$Cable.rotation = $Cable.rotation_degrees
		$Cable.scale.x = sqrt(mouse_pos.x * mouse_pos.x + mouse_pos.y * mouse_pos.y)/205
		$CPUMouseArea.position = mouse_pos
		print("pos x")
		print($Cable.position.x)
		print("pos y")
		print($Cable.position.y)
		print("scale")
		print($Cable.scale.x)
		
func _on_CPU_mouse_entered():
	isInsideCPU = true

func _on_CPU_mouse_exited():
	isInsideCPU = false
