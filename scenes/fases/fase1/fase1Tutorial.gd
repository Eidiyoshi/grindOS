extends Node2D

var connectedCPU
var connectingCPU = false
var connectCPUFlag = false

var connectedRAM
var connectingRAM = false
var connectRAMFlag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connectedCPU = get_node("CPU")
	connectedRAM = get_node("RAM")

#Cabo CPU
func ConnectCPUCable(component):
	$CPU/Cable.global_position = Vector2(($CPU.global_position.x + component.global_position.x)/2,($CPU.global_position.y + component.global_position.y)/2)
	$CPU/Cable.rotation_degrees = atan2($CPU.global_position.y - component.global_position.y,$CPU.global_position.x - component.global_position.x)
	$CPU/Cable.rotation = $CPU/Cable.rotation_degrees
	$CPU/Cable.scale.x = sqrt(($CPU.global_position.x - component.global_position.x) * ($CPU.global_position.x - component.global_position.x) + ($CPU.global_position.y - component.global_position.y) * ($CPU.global_position.y - component.global_position.y))/180

func _on_ProcessList_ConnectProcess(process):
	if connectingCPU:
		connectedCPU = process
		ConnectCPUCable(connectedCPU)

func _on_RAM_ConnectRAM(RAM):
	if connectingCPU:
		connectedCPU = RAM
		ConnectCPUCable(connectedCPU)

func _on_CPU_ConnectingCPU(value):
	print("Connecting CPU")
	print(value)
	if !value:
		$ConnectCPUDelay.start()
	else:
		connectingCPU = value
		connectedCPU = get_node("CPU")

func _on_ConnectCPUDelay_timeout():
	connectingCPU = false
	if connectedCPU == $CPU:
		$CPU/Cable.scale.x = 0
