extends Area2D

signal ConnectPort

func _ready():
	pass # Replace with function body.

func ConnectPortFunction(port):
	print(port.get_name())
	emit_signal("ConnectPort",port)

func _on_PortA_Connect(port):
	ConnectPortFunction(port)

func _on_PortB_Connect(port):
	ConnectPortFunction(port)

func _on_PortC_Connect(port):
	ConnectPortFunction(port)
