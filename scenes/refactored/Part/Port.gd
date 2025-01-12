extends Area2D

signal Connecting_Port
signal Received_Port
signal Released

var cable_scene: PackedScene = preload("res://scenes/refactored/Completed/Cable.tscn")

var mouse_inside: bool = false
var cable_inside: bool = false
var connecting: bool = false

var cable: Area2D

func _ready():
	pass # Replace with function body.

func _process(_delta) -> void:
	if connecting:
		var mouse_pos = get_local_mouse_position()
		cable.position = Vector2((mouse_pos.x)/2,(mouse_pos.y)/2)
		cable.rotation = atan2(mouse_pos.y,mouse_pos.x)
		cable.scale.x = sqrt(mouse_pos.x * mouse_pos.x + mouse_pos.y * mouse_pos.y)/64

func _input(event) -> void:
	if event is InputEventMouseButton and event.button_index == 1:
		if event.is_pressed() and mouse_inside:
			cable = cable_scene.instance()
			add_child(cable)
			cable.scale.y = cable.scale.y / self.scale.y
			print("Connecting " + self.name)
			emit_signal("Connecting_Port",self)
			connecting = true
		elif not event.is_pressed() and cable_inside:
			if connecting:
				connecting = false
				print("Released " + self.name)
				if cable != null:
					cable.queue_free()
					cable = null
				emit_signal("Released")
			elif mouse_inside:
				print("Received " + self.name)
				if cable != null:
					cable.queue_free()
					cable = null
				emit_signal("Received_Port",self)
				

func _on_Port_mouse_entered() -> void:
	mouse_inside = true

func _on_Port_mouse_exited() -> void:
	mouse_inside = false

func _on_Port_area_entered(_area) -> void:
	cable_inside = true

func _on_Port_area_exited(_area) -> void:
	cable_inside = false

func clear() -> void:
	mouse_inside = false
	cable_inside = false
	connecting = false
	if cable != null:
		cable.queue_free()
