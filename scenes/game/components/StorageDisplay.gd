extends Control

signal in_Ui
signal out_Ui

var GuiBar
var Storage

var total_size = 0

func _ready():
	Storage = self.get_parent().get_parent()
	$TypeA.value = 0
	$TypeB.value = 0
	$TypeC.value = 0
	$Trash.value = 0

func updateBar():
	var Data = Storage.Data
	
	$TypeA.max_value = PlayerData.maxStorageRAM
	$TypeB.max_value = PlayerData.maxStorageRAM
	$TypeC.max_value = PlayerData.maxStorageRAM
	$Trash.max_value = PlayerData.maxStorageRAM
	
	var valueTrash  = Data[3]
	var valueC = valueTrash + Data[2]
	var valueB = valueC + Data[1]
	var valueA = valueB + Data[0]
	
	$TypeA.value = valueA
	$TypeB.value = valueB
	$TypeC.value = valueC
	$Trash.value = valueTrash

func _on_Trash_mouse_entered():
	emit_signal("in_Ui")


func _on_Trash_mouse_exited():
	emit_signal("out_Ui")
