extends Node2D

signal ConnectProcess

func _ready():
	pass # Replace with function body.

func ConnectProcessFunction(process):
	emit_signal("ConnectProcess",process)

func _on_Process1_Connect(process):
	ConnectProcessFunction(process)

func _on_Process2_Connect(process):
	ConnectProcessFunction(process)


func _on_Process3_Connect(process):
	ConnectProcessFunction(process)


func _on_Process4_Connect(process):
	ConnectProcessFunction(process)


func _on_Process5_Connect(process):
	ConnectProcessFunction(process)
