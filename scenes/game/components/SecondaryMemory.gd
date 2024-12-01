extends Area2D

signal ConnectPort

var Data = [0,0,0]

func Full():
	var total = 0
	for i in Data.size():
		total += Data[i]
	if total >= PlayerData.maxStorageSecondary:
		return true
	else:
		return false

func _ready():
	pass # Replace with function body.
	

func ConnectPortFunction(port):
	emit_signal("ConnectPort",port)

func _on_PortA_Connect(port):
	ConnectPortFunction(port)

func _on_PortB_Connect(port):
	ConnectPortFunction(port)

func _on_PortC_Connect(port):
	ConnectPortFunction(port)
