extends Node2D

var RNG = RandomNumberGenerator.new()

var connectedCPU
var connectingCPU = false
var connectCPUFlag = false

var connectedRAM
var connectingRAM = false
var connectRAMFlag = false

var RAMtick = 0
var MemoryTick = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	connectedCPU = get_node("CPU")
	connectedRAM = get_node("RAM")

func load_data_CPU_RAM(index):
	if $RAM.Data[index] > 0:
			$RAM.Data[index] -= 1
			$CPU.Data[index] += 1

func pass_data_CPU_RAM(index):
	if $CPU.Data[index] > 0:
			$CPU.Data[index] -= 1
			$RAM.Data[index] += 1
			if RNG.randi_range(0, PlayerData.trashChance) == 0:
				$RAM.Data[3] += 1

func transfer_data_CPU_RAM():
	if $RAM/MemoryControl/Store.pressed:
		if connectedCPU == $RAM/PortA and !$RAM.Full():
			pass_data_CPU_RAM(0)
		elif connectedCPU == $RAM/PortB and !$RAM.Full():
			pass_data_CPU_RAM(1)
		elif connectedCPU == $RAM/PortC and !$RAM.Full():
			pass_data_CPU_RAM(2)
	else:
		if connectedCPU == $RAM/PortA and !$CPU.Full():
			load_data_CPU_RAM(0)
		elif connectedCPU == $RAM/PortB and !$CPU.Full():
			load_data_CPU_RAM(1)
		elif connectedCPU == $RAM/PortC and !$CPU.Full():
			load_data_CPU_RAM(2)

func load_data_RAM_SecondMemory(index):
	if $SecondaryMemory.Data[index] > 0:
			$SecondaryMemory.Data[index] -= 1
			$RAM.Data[index] += 1

func pass_data_RAM_SecondMemory(index):
	if $RAM.Data[index] > 0:
		$RAM.Data[index] -= 1
		$SecondaryMemory.Data[index] += 1

func transfer_data_RAM_SecondMemory():
	if $SecondaryMemory/MemoryControl/Store.pressed:
		if connectedCPU == $SecondaryMemory/PortA and !$SecondaryMemory.Full():
			pass_data_CPU_RAM(0)
		elif connectedCPU == $SecondaryMemory/PortB and !$SecondaryMemory.Full():
			pass_data_CPU_RAM(1)
		elif connectedCPU == $SecondaryMemory/PortC and !$SecondaryMemory.Full():
			pass_data_CPU_RAM(2)
	else:
		if connectedCPU == $SecondaryMemory/PortA and !$RAM.Full():
			load_data_CPU_RAM(0)
		elif connectedCPU == $SecondaryMemory/PortB and !$RAM.Full():
			load_data_CPU_RAM(1)
		elif connectedCPU == $SecondaryMemory/PortC and !$RAM.Full():
			load_data_CPU_RAM(2)

func _process(delta):
	if connectedCPU.get_parent() == $RAM:
		RAMtick += 1
		if RAMtick == PlayerData.ramDataResistance:
			RAMtick = 0
			transfer_data_CPU_RAM()
	if connectedRAM.get_parent() == $SecondaryMemory:
		MemoryTick += 1
		if MemoryTick == PlayerData.secondaryDataResistance:
			MemoryTick = 0
			transfer_data_RAM_SecondMemory()

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

func _on_RAM_ConnectRAMPort(ram_port):
	if connectingCPU:
		connectedCPU = ram_port
		ConnectCPUCable(connectedCPU)

func _on_CPU_ConnectingCPU(value):
	if !value:
		$ConnectCPUDelay.start()
	else:
		connectingCPU = value
		connectedCPU.connected = false
		connectedCPU = get_node("CPU")

func _on_ConnectCPUDelay_timeout():
	connectingCPU = false
	if connectedCPU == $CPU:
		$CPU/Cable.scale.x = 0
	else:
		connectedCPU.connected = true

#Cabo RAMs
func ConnectRAMCable(component):
	$RAM/Cable.global_position = Vector2(($RAM/Sprite.global_position.x + component.global_position.x)/2,($RAM/Sprite.global_position.y + component.global_position.y)/2)
	$RAM/Cable.rotation_degrees = atan2($RAM/Sprite.global_position.y - component.global_position.y,$RAM/Sprite.global_position.x - component.global_position.x)
	$RAM/Cable.rotation = $RAM/Cable.rotation_degrees
	$RAM/Cable.scale.x = sqrt(($RAM/Sprite.global_position.x - component.global_position.x) * ($RAM/Sprite.global_position.x - component.global_position.x) + ($RAM/Sprite.global_position.y - component.global_position.y) * ($CPU.global_position.y - component.global_position.y))/150

func _on_SecondaryMemory_ConnectPort(port):
	if connectingRAM:
		connectedRAM = port
		ConnectRAMCable(connectedRAM)

func _on_RAM_ConnectingRAM(value):
	if !value:
		$ConnectRAMDelay.start()
	else:
		connectingRAM = value
		connectedRAM.connected = false
		connectedRAM = get_node("RAM")

func _on_ConnectRAMDelay_timeout():
	connectingRAM = false
	if connectedRAM == $RAM:
		$RAM/Cable.scale.x = 0
	else:
		connectedRAM.connected = true

