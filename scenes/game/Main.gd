extends Node2D

var connectedCPU
var connectingCPU = false

var connectedRAM
var connectingRAM = false

var connectFlag = false

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
		connectFlag = true
		ConnectCPUCable(connectedCPU)

func _on_RAM_ConnectRAM(RAM):
	if connectingCPU:
		connectedCPU = RAM
		connectFlag = true
		ConnectCPUCable(connectedCPU)

func _on_CPU_ConnectingCPU(value):
	if !value:
		$ConnectCPUDelay.start()
	else:
		connectingCPU = value

func _on_ConnectCPUDelay_timeout():
	connectingCPU = false
	if !connectFlag:
		$CPU/Cable.scale.x = 0
	connectFlag = false

#Cabo RAM
func ConnectRAMCable(component):
	$RAM/Cable.global_position = Vector2(($RAM.global_position.x + component.global_position.x)/2,($RAM.global_position.y + component.global_position.y)/2)
	$RAM/Cable.rotation_degrees = atan2($RAM.global_position.y - component.global_position.y,$RAM.global_position.x - component.global_position.x)
	$RAM/Cable.rotation = $RAM/Cable.rotation_degrees
	$RAM/Cable.scale.x = sqrt(($RAM.global_position.x - component.global_position.x) * ($RAM.global_position.x - component.global_position.x) + ($RAM.global_position.y - component.global_position.y) * ($CPU.global_position.y - component.global_position.y))/180

func _on_SecondaryMemory_ConnectPort(port):
	if connectingRAM:
		connectedRAM = port
		connectFlag = true
		ConnectRAMCable(connectedRAM)

func _on_RAM_ConnectingRAM(value):
	if !value:
		$ConnectRAMDelay.start()
	else:
		connectingRAM = value

func _on_ConnectRAMDelay_timeout():
	connectingRAM = false
	if !connectFlag:
		$RAM/Cable.scale.x = 0
	connectFlag = false
