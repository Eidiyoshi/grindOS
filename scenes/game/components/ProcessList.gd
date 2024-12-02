extends Node2D

signal ConnectProcess
signal ProcessComplete


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


func ProcessComplete():
	emit_signal("ProcessComplete")

func _on_Process1_ProcessComplete():
	ProcessComplete()

func _on_Process2_ProcessComplete():
	ProcessComplete()

func _on_Process3_ProcessComplete():
	ProcessComplete()

func _on_Process4_ProcessComplete():
	ProcessComplete()

func _on_Process5_ProcessComplete():
	ProcessComplete()
