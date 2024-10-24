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

#Cabo RAMs
func ConnectRAMCable(component):
	$RAM/Cable.global_position = Vector2(($RAM.global_position.x + component.global_position.x)/2,($RAM.global_position.y + component.global_position.y)/2)
	$RAM/Cable.rotation_degrees = atan2($RAM.global_position.y - component.global_position.y,$RAM.global_position.x - component.global_position.x)
	$RAM/Cable.rotation = $RAM/Cable.rotation_degrees
	$RAM/Cable.scale.x = sqrt(($RAM.global_position.x - component.global_position.x) * ($RAM.global_position.x - component.global_position.x) + ($RAM.global_position.y - component.global_position.y) * ($CPU.global_position.y - component.global_position.y))/400

func _on_SecondaryMemory_ConnectPort(port):
	if connectingRAM:
		connectedRAM = port
		ConnectRAMCable(connectedRAM)

func _on_RAM_ConnectingRAM(value):
	if !value:
		$ConnectRAMDelay.start()
	else:
		connectingRAM = value
		connectedRAM = get_node("RAM")

func _on_ConnectRAMDelay_timeout():
	connectingRAM = false
	if connectedRAM == $RAM:
		$RAM/Cable.scale.x = 0
