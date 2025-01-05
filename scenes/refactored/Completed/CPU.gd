extends "res://scenes/refactored/Part/Port.gd"

var connected: Area2D = null

var Data : Array = [0,0,0]

func _ready():
	pass

func AddTypeA(number: int):
	Data[0] = clamp(Data[0] + number, 0, PlayerData.maxStorageCPU - Data[1] - Data[2])
	$Sprite/StorageBarShort.UpdateBar(Data)
	$Sprite2/StorageDescriptionShort.UpdateTypeA(Data[0])

func AddTypeB(number: int):
	Data[1] = clamp(Data[1] + number, 0, PlayerData.maxStorageCPU - Data[0] - Data[2])
	$Sprite/StorageBarShort.UpdateBar(Data)
	$Sprite2/StorageDescriptionShort.UpdateTypeB(Data[1])

func AddTypeC(number: int):
	Data[2] = clamp(Data[2] + number, 0, PlayerData.maxStorageCPU - Data[0] - Data[1])
	$Sprite/StorageBarShort.UpdateBar(Data)
	$Sprite2/StorageDescriptionShort.UpdateTypeC(Data[2])

func UpdateMax() -> void:
	$Sprite/StorageBarShort.UpdateMax()

func _on_CPU_mouse_entered():
	$Sprite2/StorageDescriptionShort.visible = true


func _on_CPU_mouse_exited():
	$Sprite2/StorageDescriptionShort.visible = false

