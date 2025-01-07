extends Node2D

var cable_scene: PackedScene = preload("res://scenes/refactored/Completed/Cable.tscn")

var connecting_CPU: bool = false
var connecting_Process: Area2D = null
var connecting_RAM: bool = false
var connecting_Memory: bool = false

var cable: Area2D = cable_scene.instance()

var Storage: Array = [10,10,10]

func _ready():
	$Process.CreateProcess(Storage)
	$Process2.CreateProcess(Storage)
	add_child(cable)
	cable.scale.y = cable.scale.y / $CPU.scale.y
	pass

func ClearConnecting() -> void:
	connecting_CPU = false
	connecting_Process = null
	connecting_RAM = false
	connecting_Memory = false

func CableCPU(CPU: Area2D, object: Area2D):
	var CPU_pos: Vector2 = CPU.global_position
	var Object_pos: Vector2 = object.global_position
	cable.global_position = Vector2((CPU_pos.x + Object_pos.x)/2,(CPU_pos.y + Object_pos.y)/2)
	cable.rotation = atan2(CPU_pos.y - Object_pos.y,CPU_pos.x - Object_pos.x)
	cable.scale.x = sqrt((CPU_pos.x - Object_pos.x) * (CPU_pos.x - Object_pos.x) + (CPU_pos.y - Object_pos.y) * (CPU_pos.y - Object_pos.y))/96

func _on_CPU_Connecting_Port(CPU) -> void:
	cable.scale.x = 0
	CPU.Disconnect()
	connecting_CPU = true

func _on_Process_Connecting_Port(Process) -> void:
	if Process == $CPU.connected:
		cable.scale.x = 0
		$CPU.Disconnect()
	connecting_Process = Process

func _on_Process_Released() -> void:
	#ClearConnecting()
	pass

func _on_CPU_Released() -> void:
	#ClearConnecting()
	pass

func _on_CPU_Received_Port(CPU):
	if connecting_Process != null:
		CableCPU(CPU,connecting_Process)
		CPU.Connect(connecting_Process)
		connecting_Process.Connect(CPU)
		connecting_Process = null

func _on_Process_Received_Port(Process):
	if connecting_CPU:
		connecting_CPU = false
		CableCPU($CPU,Process)
		$CPU.Connect(Process)
		Process.Connect($CPU)
