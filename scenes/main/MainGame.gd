extends Node

enum SystemParts {None, CPU, Process}

func _ready():
	pass # Replace with function body.

var ConnectingCPU = false

var CPUConnected = 0

func _on_CPU_Connecting():
	ConnectingCPU = true

func _on_Process_Connect():
	if ConnectingCPU:
		print("Conectou com a CPU")
		var CablePos = ($Process.position + $CPU.position)# / 2
		$CPU/Cable.position = CablePos
		#$CPU/Cable.rotation = atan2($Process.position.y, $Process.position.x)
		#$CPU/Cable.rotation = $CPU/Cable.rotation_degrees
		$CPU/Cable.scale.x = 2#sqrt($Process.position.x * $Process.position.x  + $Process.position.y * $Process.position.y) / 605
	else :
		print("Nao segurou na CPU")
		$CPU/Cable.scale.x = 0
		$CPU/CPUMouseArea.visible = false
