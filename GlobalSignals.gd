extends Node

signal ConnectGlobal
signal CancelConnect

var connected = null

func _ready():
	pass # Replace with function body.
	
func connectProcess(process)
	connected = process
	emit_signal("ConnectGlobal",connected)
