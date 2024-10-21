extends Node

var Data = [0, 0, 0]

var ConnectingCPU = false
var CPUConnected = self
var MaxData = 50

var RNG = RandomNumberGenerator.new()

func _ready():
	RNG.randomize()

func _on_CPU_Connecting():
	ConnectingCPU = true
	CPUConnected = self

func _on_Process_CancelConnect():
	ConnectingCPU = false
	if CPUConnected == self:
		$CPU/Cable.scale.x = 0
		$CPU/CPUMouseArea.visible = false

func _on_Process_Connect(Component):
	if ConnectingCPU:
		print("Conectou com a CPU")
		CPUConnected = Component
		var CablePos = (CPUConnected.global_position + $CPU.global_position) / 2
		$CPU/Cable.global_position = CablePos
		$CPU/Cable.look_at($CPU.global_position)
		$CPU/Cable.scale.x = sqrt(CPUConnected.global_position.x * CPUConnected.global_position.x  + CPUConnected.global_position.y * CPUConnected.global_position.y) / 605

func _on_Clock_timeout():
	if CPUConnected == $Process:
		print("Process")
		var pos = RNG.randi_range(0,2)
		var try = 0
		while CPUConnected.Data[pos] == 0 and try < 13:
			pos = RNG.randi_range(0,2)
			if try >= 10:
				pos = try - 10
			try += 1
		if try != 13 and Data[pos] < MaxData:
			CPUConnected.Data[pos] -= 1
			Data[pos] += 1
		else:
			print("Acabou")
		print(CPUConnected.Data)
	elif CPUConnected == $RAM/DataA:
		print("DataA")
	print("Clock tick")
